import type { Register } from 'claude-code'

const APPROVAL = 'ok, adelante, todo ok'
const CONTINUE = 'ok,continua sin detenerte hasta que necesites mi intervencion.'
const LEARN = 'learn'
const COMMIT_MESSAGE = 'commit-message'
const APPROVAL_ICON = '✅'
const CONTINUE_ICON = '⏩'
const LEARN_ICON = '🎓'
const COMMIT_MESSAGE_ICON = '📝'

export const register: Register = on => {
  on('ui.render', { component: 'AbovePrompt' }, ($, e) => {
    const { Box, Button } = $.ui.resolve(e)

    const sendApproval = () => $.prompt.submit({ text: APPROVAL })
    const sendContinue = () => $.prompt.submit({ text: CONTINUE })
    const runLearn = () => $.command.run({ command: LEARN })
    const runCommitMessage = () => $.command.run({ command: COMMIT_MESSAGE })

    return (
      <Box flexDirection="row" gap={1}>
        <Button key="approval" label={APPROVAL_ICON} onPress={sendApproval} />
        <Button key="continue" label={CONTINUE_ICON} onPress={sendContinue} />
        <Button key="learn" label={LEARN_ICON} onPress={runLearn} />
        <Button key="commit-message" label={COMMIT_MESSAGE_ICON} onPress={runCommitMessage} />
      </Box>
    )
  })
}
