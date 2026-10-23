export type ContextWarning = { percent: number; threshold: number }

declare module 'claude-code' {
  interface PluginState {
    'context-band': { warning: ContextWarning | null; lastThreshold: number }
  }
}
