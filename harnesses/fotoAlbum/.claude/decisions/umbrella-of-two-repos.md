# Umbrella of two repos

Backend and frontend are separate repos with separate pipelines, but one project for PrometeuZZ: `Sandbox/fotoAlbum/` is a plain directory, not a repo, with its harness in `harnesses/fotoAlbum/`. Why: cross-repo specs and decisions are tracked in PrometeuZZ, and no third repo or submodule needs maintaining.
