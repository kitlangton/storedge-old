class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = current_user.cart
    @order = Order.new
    if @cart.shopping_cart_items.size > 0
      @cart.shopping_cart_items.each do |line_item|
        line_item.update(owner_id:nil)
        line_item.update(owner_type:nil)
        @order.shopping_cart_items << line_item
      end
      @order.update(user_id: current_user.id)

      if @order.save
        redirect_to orders_url
        flash[:success] = "Your order has been placed successfully!"
      end
    else
      redirect_to root_url
      flash[:error] = "You can't place an empty order."
    end
  end

  def index
    @orders = current_user.orders.page params[:page]
  end
end
