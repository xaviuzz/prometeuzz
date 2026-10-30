import { expect, test } from 'claude-code/testing'
import type { Engine, On } from 'claude-code'

const PANE = {
  plugin: 'visual-explain',
  component: 'Pane',
  requestId: 'visual-explain',
  props: {
    title: 'Diagram',
    isFocused: false,
    bodyColumns: 80,
    placement: 'dock',
    scroll: { offset: 0, bodyRows: 30 },
    view: {},
  },
} as const

const TOOL = 'mcp__visual-explain__show_diagram'
const FLOW = 'flowchart LR\n  A[Start] --> B{Ok?}'

const withEngine = async ($: Engine, on: On) => {
  on('tool.register', () => ({ value: { tool: TOOL } }))
  on('ui.open', () => ({ value: { isPlaced: true } }))
  on('session.start', (_, e) => ({ cwd: e.cwd }))
  await $.session.start({ cwd: '/', surface: 'vscode', isInteractive: true })
}

const show = ($: Engine, title: string, mermaid: string) =>
  $.tool.call({ tool: TOOL, title, mermaid })

const paneText = async ($: Engine) => {
  const ui = await $.ui.mount({ ...PANE, surface: 'vscode' })
  const bold = await ui.find({ type: 'Text', text: /./ })
  await ui.unmount()
  return bold?.text
}

test('answers Claude with the title of the diagram it drew', async ($, on) => {
  await withEngine($, on)

  const answer = await show($, 'Start flow', FLOW)

  expect(answer.result).toContain('Start flow')
})

test('answers an error with the reason when Pele cannot draw', async ($, on) => {
  await withEngine($, on)

  const answer = await show($, 'Broken', 'nonsense here')

  expect(answer.deny).toContain('No diagram type detected')
})

test('the pane titles the latest diagram and a new call replaces it', async ($, on) => {
  await withEngine($, on)

  await show($, 'First', FLOW)
  await show($, 'Second', 'sequenceDiagram\n  A->>B: hi')

  expect(await paneText($)).toBe('Second')
})

test('a failed diagram shows the reason in the pane', async ($, on) => {
  await withEngine($, on)

  await show($, 'Broken', 'nonsense here')
  const ui = await $.ui.mount({ ...PANE, surface: 'vscode' })
  const reason = await ui.find({ type: 'Text', text: /No diagram type detected/ })
  await ui.unmount()

  expect(reason).toBeDefined()
})

test('the pane says so when nothing was drawn yet', async ($, on) => {
  await withEngine($, on)

  expect(await paneText($)).toBe('No diagram yet.')
})
