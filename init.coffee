# exec = require('child_process').exec
# exec('source ~/.zshrc')
#
# childProcess = require('child_process')
# process.env.PATH = childProcess.execFileSync(process.env.SHELL, ['-i', '-c', 'echo $PATH']).toString().trim()

# atom.commands.add 'atom-text-editor', 'custom:add-space-after', ->
#   return unless editor = atom.workspace.getActiveTextEditor()
#
#   for cursor in editor.getCursors()
#     position = cursor.getBufferPosition()
#     editor.buffer.insert(position, ' ')
#     cursor.setBufferPosition(position)

# surround for ruby string interpolation
atom.commands.add 'atom-text-editor', 'custom:surround-interpolation', ->
  return unless editor = atom.workspace.getActiveTextEditor()

  editor.transact ->
    # TODO: get cursor scope, add quotes if not a string
    for selection in editor.getSelections()
      text = selection.getText()
      return unless text.length

      text = "\#{#{text}}"
      selection.insertText(text)
