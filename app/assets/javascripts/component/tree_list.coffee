@btn_click = (scope) ->
  $(scope).parent().children("ul").toggle(300)

$("body").on "click", ".tree-li", -> btn_click(this)

