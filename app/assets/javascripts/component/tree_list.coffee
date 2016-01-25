@btn_click = (scope) ->
  console.log "okok"
  $(scope).parent().children("ul").toggle(300)

$(document).on "click", ".tree-li", -> btn_click(this)

