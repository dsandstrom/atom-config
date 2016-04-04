atom.commands.add 'atom-text-editor', 'custom:add-space-after', ->
  return unless editor = atom.workspace.getActiveTextEditor()

  for cursor in editor.getCursors()
    position = cursor.getBufferPosition()
    editor.buffer.insert(position, ' ')
    cursor.setBufferPosition(position)
