$(document).ready ->
  $(".status").change ->
    if this.checked == false
      $(".toDoFalseClass").append(this.parentElement)
    else
      $(".toDoTrueClass").append(this.parentElement)
