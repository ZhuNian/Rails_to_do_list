$(document).ready ->
  $(".status").change ->
    if this.checked == false
      $(".toDoFalseClass").append(this.parentElement)
    else
      $(".toDoTrueClass").append(this.parentElement)
    $.post("/to_dos/change_status"
      to_do:{id:$(this.parentElement.getElementsByClassName("to_do_id")).text(),statue:this.checked}
    )
    console.log($(this.parentElement.getElementsByClassName("to_do_id")).text())
    console.log(this.checked)

#  $("#new_to_do").on("ajax:success", (e, data, status, xhr) ->
#    $("#new_to_do").append "<p>Successed</p>"
#  ).on "ajax:error", (e, xhr, status, error) ->
#  $("#new_to_do").append "<p>ERROR</p>"

  $(".add_to_do").click  ->
    console.log($("#to_do_title").val())
    console.log($("#to_do_text").val())
    $.post("/index",
      to_do: {
        title:$("#to_do_title").val()
        text:$("#to_do_text").val()
        statue:false
      },
      (data) =>
        console.log("data")
        $(".toDoFalseClass").append(data)
    )

  paintIt = (element, backgroundColor, textColor) ->
    element.style.backgroundColor = backgroundColor
    if textColor?
      element.style.color = textColor

  $("a[data-background-color]").click ->
    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)