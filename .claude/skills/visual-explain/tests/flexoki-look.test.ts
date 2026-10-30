import { expect, test } from 'claude-code/testing'

import { FlexokiLook } from '../src/flexoki-look'

const PLAIN = '<svg xmlns="http://www.w3.org/2000/svg" style="max-width:100%"><rect/></svg>'

const dressed = (): string => new FlexokiLook().dress(PLAIN)

test('dresses the diagram in the Flexoki light paper and ink', () => {
  expect(dressed()).toContain('--pele-bg:#FFFCF0')
  expect(dressed()).toContain('--pele-fg:#100F0F')
})

test('dresses the diagram with the orange accent', () => {
  expect(dressed()).toContain('--pele-accent:#BC5215')
})

test('keeps the markup it was given', () => {
  expect(dressed()).toContain('max-width:100%')
  expect(dressed().startsWith('<svg')).toBe(true)
})

test('colors chart series with the Flexoki hues, orange first', () => {
  expect(dressed()).toContain('--pele-series-1:#BC5215')
  expect(dressed()).toContain('--pele-series-8:#A02F6F')
})
