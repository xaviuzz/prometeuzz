import { render } from '../vendor/pele.js'

import type { ShownDiagram } from '../types'
import { FlexokiLook } from './flexoki-look'

const PANE_SVG_LIMIT = 131072

export class DiagramDrawer {
  private readonly look = new FlexokiLook()

  draw(title: string, mermaid: string): ShownDiagram {
    let shown: ShownDiagram = { title, mermaid, svg: null, reason: null }

    try {
      const drawn = render(mermaid)
      const dressed = this.look.dress(drawn.svg)
      const isTooLarge = dressed.length > PANE_SVG_LIMIT
      if (isTooLarge) {
        shown = { ...shown, reason: `Diagram too large for the pane (${dressed.length} characters, limit ${PANE_SVG_LIMIT})` }
      } else {
        shown = { ...shown, svg: dressed }
      }
    } catch (error) {
      const reason = error instanceof Error ? error.message : String(error)
      shown = { ...shown, reason }
    }

    return shown
  }
}
