import { atom, read, update } from 'claude-code'
import type { Register } from 'claude-code'

import type { ContextWarning } from '../types'

const THRESHOLDS = [5, 10, 20]

const warning = atom({ plugin: 'context-band', key: 'warning' } as const, null)
const lastThreshold = atom({ plugin: 'context-band', key: 'lastThreshold' } as const, 0)

const highestCrossed = (percent: number): number => {
  let crossed = 0
  for (const threshold of THRESHOLDS) {
    if (percent > threshold) {
      crossed = threshold
    }
  }
  return crossed
}

export const register: Register = on => {
  on('session.measure', async ($, e, next) => {
    const percent = e.context.percent ?? 0
    const crossed = highestCrossed(percent)
    const warned = await read($, lastThreshold)

    if (crossed > warned) {
      const crossing: ContextWarning = { percent, threshold: crossed }
      await update($, lastThreshold, () => crossed)
      await update($, warning, () => crossing)
    }

    return next(e)
  })

  on('ui.render', { component: 'AbovePrompt' }, async ($, e, next) => {
    const crossing = await read($, warning)
    const isQuiet = e.props.hasSurvey || crossing === null

    if (isQuiet) {
      return next(e)
    }

    const { Box, Button, Text } = $.ui.resolve(e)

    return (
      <Box>
        <Text color="red" bold>
          Context at {crossing.percent}%, over the {crossing.threshold}% threshold{' '}
        </Text>
        <Button
          key="dismiss"
          label="Dismiss"
          onPress={() => update($, warning, () => null)}
        />
      </Box>
    )
  })
}
