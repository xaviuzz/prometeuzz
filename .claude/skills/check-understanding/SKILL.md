---
name: check-understanding
description: Quiz Xavier, one question at a time, to find out whether he understands a part of a project or a technique. Use for "comprueba si entiendo", "hazme preguntas sobre", "simulación de comprensión", "check my understanding".
---

Find out what Xavier understands of a module or technique. This is a check, not an exam: simple questions, one at a time.

## 1. Prepare

Read every file of the target. Grep for who uses it outside the target. Split it into concepts and keep them as a private tracking table: one row per concept, all ⚪. Keep the table to yourself: no introduction, no method explanation, no table in the replies.

- No target given: ask for one, recommending the folder or file open in the IDE.

Done when every concept is a row and every file was read.

## 2. Ask

Send **one** simple question per message, on the least-covered concept. Ask it without its answer, so it measures something. Vary the type:

- **Prediction**: "what does X return for this input?"
- **Why**: "why is it written this way?"
- **Hypothetical**: "if I change this line, what happens?"

The first message of the session is the first question. Xavier answers from memory. "No sé" is a valid answer.

The question carries no recommended answer or default: this overrides the CLAUDE.md rule on recommended defaults. A bare "ok" or the button bar's "ok, adelante, todo ok" is no answer; repeat the same question.

## 3. Grade

Mark 🔴 only what he **says and is false**. An omission is never a mark and never costs a state. Judge by whether his explanation works, not by whether it uses textbook vocabulary.

- A sentence is ambiguous: ask what he meant before grading it.
- His claim is about code outside the target: grep it before calling it right or wrong.

Reply with a short correction when something was false, then the next question.

| State | Meaning |
|---|---|
| ⚪ | not asked |
| 🟢 | nothing false said |
| 🔴 | said something false |

A 🔴 closes with a new question on the same concept, answered correctly.

## 4. Close

Done when no row is ⚪ or 🔴. Show the table once, with the one thing he got wrong, if any. Write nothing to disk unless he asks.
