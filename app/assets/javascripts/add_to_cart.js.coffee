$ ->
  $(".add-to-cart-button").click ->
    product_id = $(@).closest(".add-to-cart").data "product-id"
    quantity = $(@).closest(".add-to-cart").find(".quantity-field input").val()
    $.ajax
      type: "POST"
      url: "/shopping_cart_items"
      data:
        product_id: product_id
        quantity: quantity
      success: (data) ->
        alert "(#{data.quantity}) #{data.name} added to the cart #{data.total_quantity}"
      error: (data) ->
        alert "error: " + data
