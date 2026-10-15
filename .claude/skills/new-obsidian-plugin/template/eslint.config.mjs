import { defineConfig } from "eslint/config";
import obsidianmd from "eslint-plugin-obsidianmd";

export default defineConfig([
	{ ignores: ["node_modules/", "**/main.js"] },
	...obsidianmd.configs.recommended,
	{
		languageOptions: {
			parserOptions: {
				projectService: {
					allowDefaultProject: ["eslint.config.*", "*.mjs"],
				},
			},
		},
	},
	{
		files: ["**/*.test.ts"],
		languageOptions: {
			globals: {
				describe: "readonly",
				it: "readonly",
				expect: "readonly",
				beforeEach: "readonly",
				afterEach: "readonly",
			},
		},
	},
	{
		files: ["**/*.mjs", "vitest.config.ts"],
		languageOptions: {
			globals: { process: "readonly", __dirname: "readonly" },
		},
		rules: { "obsidianmd/no-nodejs-modules": "off" },
	},
]);
