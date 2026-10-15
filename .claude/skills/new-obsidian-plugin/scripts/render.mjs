import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from "fs";
import { join } from "path";
import { fileURLToPath } from "url";

const templateDirectory = join(fileURLToPath(new URL(".", import.meta.url)), "..", "template");
const kebabCase = /^[a-z][a-z0-9]*(-[a-z0-9]+)*$/;

const [destination, name, description, intro] = process.argv.slice(2);

function capitalised(text) {
	return text.charAt(0).toUpperCase() + text.slice(1);
}

function pascalCase(kebab) {
	let result = "";
	for (const word of kebab.split("-")) {
		result += capitalised(word);
	}
	return result;
}

function validate() {
	if (!destination || !name || !description || !intro) {
		throw new Error("usage: render.mjs <destination> <name> <description> <intro>");
	}
	if (!kebabCase.test(name)) {
		throw new Error(`name must be kebab-case: ${name}`);
	}
	if (/["\\]/.test(description)) {
		throw new Error("description cannot contain a double quote or a backslash: it goes into JSON");
	}
	if (existsSync(destination)) {
		throw new Error(`destination exists: ${destination}`);
	}
}

validate();

const values = {
	name,
	description,
	intro,
	displayName: capitalised(name.replace(/-/g, " ")),
	className: `${pascalCase(name)}Plugin`,
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

copy(templateDirectory, destination);
