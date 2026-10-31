import json
import os
import sys
from datetime import datetime
from pathlib import Path

CONTEXT_LIMIT = 1_000_000
HIGHLIGHT_FROM = 0.10
DEFAULT_SESSIONS = 15


class Session:
    def __init__(self, transcript):
        self.transcript = transcript
        self.endedAt = None
        self.tokens = 0
        self.model = ""
        self.read()

    def read(self):
        for line in self.transcript.read_text().splitlines():
            self.readLine(line)

    def readLine(self, line):
        try:
            entry = json.loads(line)
        except ValueError:
            return
        message = entry.get("message")
        isAssistant = entry.get("type") == "assistant"
        hasUsage = isinstance(message, dict) and message.get("usage")
        if isAssistant and hasUsage:
            usage = message["usage"]
            self.tokens = (
                usage.get("input_tokens", 0)
                + usage.get("cache_read_input_tokens", 0)
                + usage.get("cache_creation_input_tokens", 0)
            )
            self.endedAt = entry.get("timestamp")
            self.model = message.get("model", "")

    def hasUsage(self):
        return self.endedAt is not None

    def share(self):
        return self.tokens / CONTEXT_LIMIT

    def exceedsThreshold(self):
        return self.share() > HIGHLIGHT_FROM

    def row(self):
        moment = datetime.fromisoformat(self.endedAt.replace("Z", "+00:00")).astimezone()
        id = self.transcript.stem[:8]
        when = moment.strftime("%d %b %H:%M")
        tokens = f"{self.tokens:,}".replace(",", ".")
        percent = f"{self.share() * 100:.1f} %".replace(".", ",")
        cells = [id, when, self.model, tokens, percent]
        if self.exceedsThreshold():
            cells = [f"**{cell}**" for cell in cells]
            cells.append("🔺")
        else:
            cells.append("")
        return "| " + " | ".join(cells) + " |"


def transcriptsFolder():
    folderName = os.getcwd().replace("/", "-")
    return Path.home() / ".claude" / "projects" / folderName


def recentSessions(count):
    transcripts = sorted(transcriptsFolder().glob("*.jsonl"), key=os.path.getmtime, reverse=True)
    sessions = []
    for transcript in transcripts:
        session = Session(transcript)
        if session.hasUsage():
            sessions.append(session)
        if len(sessions) == count:
            break
    return sessions


def report(sessions):
    over = [session for session in sessions if session.exceedsThreshold()]
    limit = f"{CONTEXT_LIMIT:,}".replace(",", ".")
    lines = [
        f"Context at the last message of each session, over a limit of {limit} tokens.",
        "",
        "| Session | End | Model | Tokens | % | >10 % |",
        "|---|---|---|---|---|---|",
    ]
    for session in sessions:
        lines.append(session.row())
    lines.append("")
    share_over = len(over) / len(sessions) * 100
    lines.append(
        f"{len(over)} of {len(sessions)} sessions ({share_over:.0f} %) went over {HIGHLIGHT_FROM * 100:.0f} %."
    )
    return "\n".join(lines)


def main():
    count = DEFAULT_SESSIONS
    if len(sys.argv) > 1:
        count = int(sys.argv[1])
    print(report(recentSessions(count)))


main()
