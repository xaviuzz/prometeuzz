import { atom, read, update } from 'claude-code'
import type { Register } from 'claude-code'

import type { ShownDiagram } from '../types'
import { DiagramDrawer } from '../src/diagram-drawer'

const PANE = 'visual-explain'
const TOOL = 'mcp__visual-explain__show_diagram'

const shown = atom({ plugin: 'visual-explain', key: 'shown' } as const, null)

const readTitle = (input: unknown): string => String((input as { title?: unknown }).title ?? 'Diagram')
const readMermaid = (input: unknown): string => String((input as { mermaid?: unknown }).mermaid ?? '')

export const register: Register = on => {
  on('session.start', async ($, e, next) => {
    await $.tool.register({
      name: 'show_diagram',
      description:
        'Draws a Mermaid diagram with Pele in the Flexoki light palette and shows it in a pane beside the chat, replacing the previous one. Answers an error with the reason when the diagram cannot be drawn.',
      inputSchema: {
        type: 'object',
        properties: {
          mermaid: { type: 'string', description: 'The Mermaid source, without code fences.' },
          title: { type: 'string', description: 'One line naming what the diagram shows.' },
        },
        required: ['mermaid', 'title'],
      },
      isDeferred: false,
    })

    return next(e)
  })

  on('tool.call', { tool: TOOL }, async ($, e) => {
    const diagram = new DiagramDrawer().draw(readTitle(e), readMermaid(e))
    await update($, shown, () => diagram)
    await $.ui.open({ id: PANE, title: 'Diagram' })

    if (diagram.reason !== null) {
      return { deny: `Cannot draw "${diagram.title}": ${diagram.reason}` }
    }

    return { result: `Drawn in the pane: ${diagram.title}` }
  })

  on('ui.render', { component: 'Pane', requestId: PANE }, async ($, e) => {
    const { Box, Text, Svg, Code } = $.ui.resolve(e)
    const diagram = (await read($, shown)) as ShownDiagram | null

    if (diagram === null) {
      return <Text dimColor>No diagram yet.</Text>
    }

    if (diagram.svg === null) {
      return (
        <Box flexDirection="column">
          <Text bold>{diagram.title}</Text>
          <Text color="red">{diagram.reason}</Text>
          <Code source={diagram.mermaid} />
        </Box>
      )
    }

    return (
      <Box flexDirection="column">
        <Text bold>{diagram.title}</Text>
        <Svg source={diagram.svg} alt={diagram.title} />
      </Box>
    )
  })
}
