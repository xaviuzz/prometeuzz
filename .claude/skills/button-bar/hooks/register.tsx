import type { Register } from 'claude-code'

const PANE = 'button-bar'
const TITLE = 'Buttons'
const APPROVAL = 'ok, adelante, todo ok'
const LEARN = 'learn'
const COMMIT_MESSAGE = 'commit-message'
const APPROVAL_ICON = '✅'
const LEARN_ICON = '🎓'
const COMMIT_MESSAGE_ICON = '📝'

export const register: Register = on => {
  on('session.start', async ($, e, next) => {
    void $.ui.open({ id: PANE, title: TITLE })

    return next(e)
  })

  on('ui.render', { component: 'Pane', requestId: PANE }, ($, e) => {
    const { Box, Button } = $.ui.resolve(e)

    const sendApproval = () => $.prompt.submit({ text: APPROVAL })
    const runLearn = () => $.command.run({ command: LEARN })
    const runCommitMessage = () => $.command.run({ command: COMMIT_MESSAGE })

    return (
      <Box flexDirection="row" gap={1}>
        <Button key="approval" label={APPROVAL_ICON} onPress={sendApproval} />
        <Button key="learn" label={LEARN_ICON} onPress={runLearn} />
        <Button key="commit-message" label={COMMIT_MESSAGE_ICON} onPress={runCommitMessage} />
      </Box>
    )
  })
}
