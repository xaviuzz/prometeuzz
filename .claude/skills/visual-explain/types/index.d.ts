export type ShownDiagram = {
  title: string
  mermaid: string
  svg: string | null
  reason: string | null
}

declare module 'claude-code' {
  interface PluginState {
    'visual-explain': { shown: ShownDiagram | null }
  }
}
