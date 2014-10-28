$ ->

  $(".form").submit (event)->
    event.preventDefault()
  $(".cart-add-toggle").click ->
    $(@).closest(".card").find(".form").slideDown()
    $(@).slideUp()
    $(@).closest(".card").find(".quantity-field input").focus()
  $(".add-to-cart-button").click ->
    product_id = $(@).closest(".add-to-cart").data "product-id"
    quantity = $(@).closest(".add-to-cart").find(".quantity-field input").val()
    $(@).closest(".form").find(".quantity-field input").val ""
    $(@).closest(".form").slideUp()
    $(@).closest(".card").find(".cart-add-toggle").slideDown()
    $.ajax
      type: "POST"
      url: "/shopping_cart_items"
      data:
        product_id: product_id
        quantity: quantity
      success: (data) ->
        noty 
          text: "#{data.quantity} #{data.name} added to the cart (#{data.total_quantity} total)"
          type: 'success'
          timeout: 3000
          layout: 'topCenter'
      error: (data) ->
        alert "error: " + data
