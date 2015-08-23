$(document).ready ->
  $(".status").change ->
    if this.checked == false
      $(".toDoFalseClass").append(this.parentElement)
    else
      $(".toDoTrueClass").append(this.parentElement)

#  $(".addToDoList").click() ->
#    alert("hekko")
#$("#new_post").on("ajax:success", (e, data, status, xhr) ->
#  $("#new_post").append xhr.responseText
#).on "ajax:error", (e, xhr, status, error) ->
#  $("#new_post").append "<p>ERROR</p>"

  paintIt = (element, backgroundColor, textColor) ->
    element.style.backgroundColor = backgroundColor
    if textColor?
      element.style.color = textColor

  $("a[data-background-color]").click ->
    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)