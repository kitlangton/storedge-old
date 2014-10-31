class ShoppingCartItemsController < ApplicationController
  include ActiveSupport::NumberHelper
  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart
    @quantity = params[:quantity].to_i
    @line_item = @cart.add(@product,@product.price.to_f,@quantity,false)
    if @quantity == 0
      @cart.remove(@product)
    end
    respond_to do |format|
      format.json do
        render json: {
          name: @product.name,
          quantity: @quantity,
          total_quantity: @line_item.quantity,
          cart_quantity: @cart.total_unique_items,
          subtotal: number_to_currency(@product.price.to_f * @line_item.quantity),
        }
      end
    end
  end
end
