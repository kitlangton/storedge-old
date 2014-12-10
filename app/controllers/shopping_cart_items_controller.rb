class ShoppingCartItemsController < ApplicationController
  include ActiveSupport::NumberHelper

  def update
    @cart = current_user.cart
    @line_item = ShoppingCartItem.find(params[:id])
    if @line_item.update(shopping_cart_item_params)
      respond_to do |format|
        format.html
        format.json do
          render json: {
            line_item: @line_item,
            subtotal: number_to_currency(@line_item.subtotal),
            cart_total_items: @cart.total_unique_items,
            cart_subtotal: number_to_currency(@cart.subtotal),
          }
        end
      end
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart
    @quantity = params[:quantity]
    @line_item = @cart.add(@product,@product.price.to_f,@quantity.to_i,false)
    if @quantity.to_i < 0 || @quantity !~ /[0-9]/
      raise ArgumentError
    elsif @quantity == "0"
      @cart.remove(@product, 10000000)
    end
    respond_to do |format|
      format.json do
        render json: {
          name: @product.name,
          quantity: @quantity.to_i,
          total_quantity: @line_item.quantity,
          cart_quantity: @cart.total_unique_items,
          subtotal: number_to_currency(@product.price.to_f * @line_item.quantity),
        }
      end
    end
  end

  def destroy
    @cart = current_user.cart
    @line_item = ShoppingCartItem.find(params[:id])
    if @line_item.destroy
      render json: {
        cart_total_items: @cart.total_unique_items,
        cart_subtotal: number_to_currency(@cart.subtotal),
      }
    end
  end

  private

  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:quantity)
  end
end
