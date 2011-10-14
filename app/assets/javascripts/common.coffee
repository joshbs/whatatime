$ ->
  $.fn.clear = ->
    $(this).find(":input").each ->
      type = @type
      null if type == "password"
      null if type == "select-multiple"
      null if type == "select-one"
      null if type == "text"
      $(this).val ""  if type == "textarea"
      null if type == "checkbox"
      @checked = false  if type == "radio"

  setPageControlWidth = (duration) ->
    duration = duration or 0
    app_width = $("#page_navigation").width()
    nav_width = 0
    $("#page_navigation > *").each ->
      nav_width += $(this).outerWidth(true)
    
    diff = (app_width - nav_width)
    $("#page_navigation > .control > form > #time_entry_name").animate width: ("+=" + diff), duration

  openPageControl = (duration, input) ->
    pageControlOpen = true
    if input
      $("#page_navigation > .control > form > #time_entry_name").focus()
      $("#page_navigation > .control > form > #time_entry_name").val (i, value) ->
        value + input
    $("#page_navigation > *").stop true, false
    $("#page_navigation > *").animate left: 0, duration
    setPageControlWidth duration

  closePageControl = (duration) ->
    pageControlOpen = false
    $("#page_navigation > .control > form").clear()
    $("#page_navigation > .control > form > #time_entry_name").blur()
    
    to = $("#page_navigation > .control > .cancel").offset()
    from = $("#page_navigation > .control > .add").offset()
    $("#page_navigation > *").stop true, false
    $("#page_navigation > *").animate left: to.left - from.left, duration
  
  pageControlOpen = false
  setPageControlWidth()
  closePageControl 0
  $("#page_navigation > .control > .add").click ->
    openPageControl 200
  
  $("#page_navigation > .control > .cancel").click ->
    closePageControl 200
  
  $(document).keyup (e) ->
    e.preventDefault()
    closePageControl 200  if e.which == 27
    openPageControl 200  if e.ctrlKey and e.altKey and not e.shiftKey and e.keyCode == 78
    $("#undo").click()  if e.ctrlKey and not e.altKey and not e.shiftKey and e.keyCode == 90
  
  $(document).keypress (e) ->
    openPageControl 100, String.fromCharCode(event.keyCode)  if not e.ctrlKey and not e.altKey
    e.preventDefault()  unless e.which == 13
