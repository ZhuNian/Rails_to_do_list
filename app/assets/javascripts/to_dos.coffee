$(document).ready ->
  $(".status").change ->
    if this.checked == false
      $(".toDoFalseClass").append(this.parentElement.parentElement)
    else
      $(".toDoTrueClass").append(this.parentElement.parentElement)
    $.post("/to_dos/change_status"
      to_do:{id:$(this.parentElement.parentElement.getElementsByClassName("to_do_id")).text(),statue:this.checked}
    )

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

  $("#edit-form").dialog({
    modal: true
    autoOpen: false
    buttons:{
      "OK": =>
        $.post("/to_dos/edit_to_do_list",
          data:{
            title:$("#title-input").val()
            text:$("#text-input").val()
          }
        )
        $("#edit-form").dialog( "close" )
        $(this.parentElement.parentElement.getElementsByClassName("to_do_title")).text($("#title-input").val())
        $(this.parentElement.parentElement.getElementsByClassName("to_do_text")).text($("#text-input").val())
      "Cancel":=> $( "#edit-form" ).dialog( "close" )
    }
  })

  $(".edit-buttton").click ->
    $("#title-input").val($(this.parentElement.parentElement.getElementsByClassName("to_do_title")).text())
    $("#text-input").val($(this.parentElement.parentElement.getElementsByClassName("to_do_text")).text())
    $("#edit-form").dialog('open')


  $(".delete-btn").click ->
    console.log("clicked delete")
    delete_id = $(this.parentElement.parentElement.getElementsByClassName("to_do_id")).text()
    delete_status = this.parentElement.parentElement.parentElement.className
    $(this.parentElement.parentElement).remove()
    $.get("/index/#{delete_id}",
      (data) =>
        if delete_status.includes("True")
          console.log("true")

        else
          console.log("false")
    )

  paintIt = (element, backgroundColor, textColor) ->
    element.style.backgroundColor = backgroundColor
    if textColor?
      element.style.color = textColor

  $("a[data-background-color]").click ->
    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)