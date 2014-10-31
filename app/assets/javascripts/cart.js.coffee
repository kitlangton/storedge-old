
$ ->
  colorFlashRed = (el) ->
    el.velocity
      color: "#ff0000"
    ,
      duration: 200
      complete: ->
        el.velocity
          color: "#000000"
        ,
          duration: 200
  colorFlash = (el) ->
    el.velocity
      color: "#7CFC00"
    ,
      duration: 200
      complete: ->
        el.velocity
          color: "#000000"
        ,
          duration: 200
  $('.best_in_place').best_in_place
    type: "input"
  $('.best_in_place').bind "ajax:success", (event, data) ->
    info = JSON.parse(data)
    $(@).closest("tr").find(".item-subtotal-cart").text info.subtotal
    colorFlash($(@).closest("tr").find(".item-subtotal-cart"))
    $(@).closest("table").find(".cart-subtotal").text info.cart_subtotal
    colorFlash($(@).closest("table").find(".cart-subtotal"))
    $(@).closest("table").find(".cart-total-quantity").text info.cart_total_items
    $(@).closest("body").find(".cart-total-count").text info.cart_total_items

  $(".remove-button").bind "ajax:success", (event, info) ->
    $(@).closest("tr").fadeOut()
    $(@).closest("table").find(".cart-subtotal").text info.cart_subtotal
    colorFlashRed($(@).closest("table").find(".cart-subtotal"))
    $(@).closest("table").find(".cart-total-quantity").text info.cart_total_items
    $(@).closest("body").find(".cart-total-count").text info.cart_total_items
