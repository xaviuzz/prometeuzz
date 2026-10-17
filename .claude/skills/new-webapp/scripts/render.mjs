import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, symlinkSync, writeFileSync } from "fs";
import { join, resolve } from "path";
import { fileURLToPath } from "url";

const templateDirectory = join(fileURLToPath(new URL(".", import.meta.url)), "..", "template");
const namePattern = /^[A-Za-z][A-Za-z0-9]*(-[A-Za-z0-9]+)*$/;
const repositories = ["backend", "frontend", "e2e"];

const [root, name] = process.argv.slice(2);

function validate(umbrellaDirectory, harnessDirectory) {
	if (!root || !name) {
		throw new Error("usage: render.mjs <PrometeuZZ root> <name>");
	}
	if (!namePattern.test(name)) {
		throw new Error(`name must be letters, digits and hyphens, starting with a letter: ${name}`);
	}
	if (existsSync(umbrellaDirectory)) {
		throw new Error(`destination exists: ${umbrellaDirectory}`);
	}
	if (existsSync(harnessDirectory)) {
		throw new Error(`destination exists: ${harnessDirectory}`);
	}
}

const absoluteRoot = resolve(root ?? ".");
const umbrellaDirectory = join(absoluteRoot, "Sandbox", name ?? "");
const harnessDirectory = join(absoluteRoot, "harnesses", name ?? "");

validate(umbrellaDirectory, harnessDirectory);

const values = {
	name,
	packageName: name.toLowerCase(),
};

function fill(text) {
	let result = text;
	for (const [key, value] of Object.entries(values)) {
		result = result.split(`{{${key}}}`).join(value);
	}
	return result;
}

function copy(source, target) {
	mkdirSync(target, { recursive: true });
	for (const entry of readdirSync(source)) {
		const from = join(source, entry);
		const to = join(target, fill(entry));
		if (statSync(from).isDirectory()) {
			copy(from, to);
		} else {
			writeFileSync(to, fill(readFileSync(from, "utf8")));
		}
	}
}

for (const repository of repositories) {
	copy(join(templateDirectory, repository), join(umbrellaDirectory, repository));
}
copy(join(templateDirectory, "harness"), harnessDirectory);
symlinkSync(join(harnessDirectory, "CLAUDE.md"), join(umbrellaDirectory, "CLAUDE.md"));
symlinkSync(join(harnessDirectory, ".claude"), join(umbrellaDirectory, ".claude"));
