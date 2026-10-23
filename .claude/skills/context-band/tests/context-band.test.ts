import { expect, test } from 'claude-code/testing'
import type { Engine, On } from 'claude-code'

const BAND = { component: 'AbovePrompt', props: { hasSurvey: false } } as const

const measure = (percent: number) => ({
  context: { window: 1000, tokens: percent * 10, percent },
  rateLimits: [],
  changed: ['context' as const],
})

const showsBand = async ($: Engine) => {
  const ui = await $.ui.mount({ plugin: 'context-band', surface: 'terminal', ...BAND })
  const text = await ui.find({ type: 'Text', text: /Context at/ })
  await ui.unmount()
  return text !== undefined
}

const withEngine = async ($: Engine, on: On) => {
  on('session.measure', (_$, e) => ({ changed: e.changed }))
  on('ui.render', ($, e) => $.ui.resolve(e).Box({}))
}

test('shows no band below the first threshold', async ($, on) => {
  await withEngine($, on)
  await $.session.measure(measure(4))
  expect(await showsBand($)).toBe(false)
})

test('shows the band once a threshold is crossed', async ($, on) => {
  await withEngine($, on)
  await $.session.measure(measure(6))
  expect(await showsBand($)).toBe(true)
})

test('dismiss hides the band until the next threshold', async ($, on) => {
  await withEngine($, on)
  await $.session.measure(measure(6))
  const ui = await $.ui.mount({ plugin: 'context-band', surface: 'terminal', ...BAND })
  await ui.press({ key: 'dismiss' })
  await ui.unmount()
  await $.session.measure(measure(8))
  expect(await showsBand($)).toBe(false)
  await $.session.measure(measure(11))
  expect(await showsBand($)).toBe(true)
})
