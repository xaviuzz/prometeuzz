import os, re, sys
root = os.path.abspath(sys.argv[1])
pairs = [a.split("=") for a in sys.argv[2:]]
moves = {os.path.join(root, o): os.path.join(root, n) for o, n in pairs}
files = []
for base in ("src", "test"):
    for d, _, fs in os.walk(os.path.join(root, base)):
        for f in fs:
            if f.endswith(".ts"):
                files.append(os.path.join(d, f))
pat = re.compile(r'(from\s+")(\.[^"]*)(")')
out = {}
for f in files:
    new_f = moves.get(f, f)
    text = open(f).read()
    def fix(m):
        target = os.path.normpath(os.path.join(os.path.dirname(f), m.group(2)))
        new_t = moves.get(target, target)
        rel = os.path.relpath(new_t, os.path.dirname(new_f))
        if not rel.startswith("."):
            rel = "./" + rel
        return m.group(1) + rel + m.group(3)
    out[f] = (new_f, pat.sub(fix, text))
for f, (new_f, text) in out.items():
    if new_f != f:
        os.makedirs(os.path.dirname(new_f), exist_ok=True)
        os.remove(f)
    open(new_f, "w").write(text)
