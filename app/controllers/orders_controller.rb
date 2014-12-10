class OrdersController < ApplicationController

  def create
    @cart = current_user.cart
    @order = Order.new
    @cart.shopping_cart_items.each do |line_item|
      line_item.update(order_id:@order)
    end
    if @cart.shopping_cart_items.size > 0
      if @order.save
        redirect_to root_path
        flash[:success] = "Your order has been placed successfully!"
        @cart.clear
      end
    else
      redirect_to root_path
      flash[:error] = "You can't place an empty order."
    end
  end

end
