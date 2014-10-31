$ ->
  $(".has-tooltip").qtip
    style:
      classes: 'qtip-tipsy'
    content:
      attr: 'data-tooltip'

  $(".form").submit (event)->
    event.preventDefault()
  $(".cart-add-toggle").click ->
    $(@).closest(".card").find(".form").slideDown()
    $(@).slideUp()
    $(@).closest(".card").find(".quantity-field input").focus()
    $(@).closest(".card").find(".quantity-field input").select()
  $(".add-to-cart-button").click ->
    product_id = $(@).closest(".add-to-cart").data "product-id"
    quantity = $(@).closest(".add-to-cart").find(".quantity-field input").val()
    quantity_field = $(@).closest(".add-to-cart").find(".quantity-field input")
    quantity_label = $(@).closest(".card").find(".cart-quantity-label")
    cart_total_count = $('.cart-total-count')
    $(@).closest(".form").find(".quantity-field input").val ""
    $(@).closest(".form").slideUp()
    $(@).closest(".card").find(".cart-add-toggle").slideDown()
    $.ajax
      type: "POST"
      url: "/shopping_cart_items"
      data:
        product_id: product_id
        quantity: quantity
      success: (stuff) ->
        quantity_label.text stuff.total_quantity
        quantity_label.qtip
          style:
            classes: 'qtip-tipsy'
          content:
            text: stuff.subtotal
        quantity_label.velocity "callout.pulse"
        cart_total_count.text stuff.cart_quantity
        cart_total_count.velocity "callout.pulse"
        callback = -> quantity_field.val stuff.total_quantity
        setTimeout callback, 500
        noty 
          text: "#{stuff.quantity} #{stuff.name} in the cart"
          type: 'success'
          timeout: 3000
          layout: 'topCenter'
      error: (stuff) ->
        alert "error: " + stuff
