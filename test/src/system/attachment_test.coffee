editorModule "Attachments", template: "editor_with_image"

editorTest "moving an image by drag and drop", (expectDocument) ->
  typeCharacters "!", ->
    moveCursor direction: "right", times: 1, (coordinates) ->
      img = document.activeElement.querySelector("img")
      triggerEvent(img, "mousedown")
      after 1, ->
        dragToCoordinates coordinates, ->
          expectDocument "!a#{Trix.OBJECT_REPLACEMENT_CHARACTER}b\n"

editorTest "removing an image", (expectDocument) ->
  clickElement getFigure(), ->
    closeButton = getFigure().querySelector(".remove")
    clickElement closeButton, ->
      expectDocument "ab\n"

getFigure = ->
  document.activeElement.querySelector("figure.attachment.image")
