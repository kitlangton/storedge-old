$ ->
  $("a.delete-company-button").on "ajax:success", ->
    $(@).closest(".card-container").velocity "transition.slideUpOut"
