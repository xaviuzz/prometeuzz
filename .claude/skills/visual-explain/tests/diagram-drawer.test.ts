import { expect, test } from 'claude-code/testing'

import { DiagramDrawer } from '../src/diagram-drawer'

const FLOW = 'flowchart LR\n  A[Start] --> B{Ok?}'

const draw = (title: string, mermaid: string) => new DiagramDrawer().draw(title, mermaid)

const hugeFlow = (): string => {
  const lines = ['flowchart TD']
  for (let node = 0; node < 600; node++) {
    lines.push(`  N${node}[Step ${node}] --> N${node + 1}[Step ${node + 1}]`)
  }

  return lines.join('\n')
}

test('draws Mermaid text as an SVG in the Flexoki palette', () => {
  const shown = draw('Start flow', FLOW)

  expect(shown.svg).toContain('<svg')
  expect(shown.svg).toContain('--pele-accent:#BC5215')
  expect(shown.reason).toBeNull()
})

test('keeps the title and the Mermaid text with the drawing', () => {
  const shown = draw('Start flow', FLOW)

  expect(shown.title).toBe('Start flow')
  expect(shown.mermaid).toBe(FLOW)
})

test('reports the reason when Pele cannot draw the text', () => {
  const shown = draw('Broken', 'nonsense here')

  expect(shown.svg).toBeNull()
  expect(shown.reason).toContain('No diagram type detected')
})

test('reports a diagram too large for the pane as a failure', () => {
  const shown = draw('Huge', hugeFlow())

  expect(shown.svg).toBeNull()
  expect(shown.reason).toContain('too large')
})
