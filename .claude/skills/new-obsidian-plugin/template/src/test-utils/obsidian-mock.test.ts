import {{className}} from '../main';

describe('obsidian mock', () => {
	it('lets the plugin module load without Obsidian', () => {
		expect({{className}}).toBeDefined();
	});
});
