atom.commands.add 'atom-text-editor', 'custom:add-space-after', ->
  return unless editor = atom.workspace.getActiveTextEditor()

  for cursor in editor.getCursors()
    position = cursor.getBufferPosition()
    editor.buffer.insert(position, ' ')
    cursor.setBufferPosition(position)

atom.commands.add 'atom-text-editor', 'custom:surround-interpolation', ->
  return unless editor = atom.workspace.getActiveTextEditor()

  editor.transact ->
    for selection in editor.getSelections()
      text = selection.getText()
      return unless text.length

      text = "\#{#{text}}"
      selection.insertText(text)
