class ShoppingCartItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart
    @quantity = params[:quantity].to_i
    @line_item = @cart.add(@product,@product.price.to_f,@quantity)
    respond_to do |format|
      format.json do
        render json: {
          name: @product.name,
          quantity: @quantity,
          total_quantity: @line_item.quantity,
          subtotal: (@product.price.to_f * @line_item.quantity),
        }
      end
    end
  end
end
