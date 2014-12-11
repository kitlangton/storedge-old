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
      @order.update(company_id: current_user.company.id)
      if @order.save
        OrderMailer.new_order_email(current_user, @order).deliver
        redirect_to orders_url
        flash[:success] = "Your order has been placed successfully!"
      end
    else
      redirect_to root_url
      flash[:error] = "You can't place an empty order."
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path
      flash[:success] = "Order ##{@order.id}'s status has been changed successfully!"
    else
      redirect_to order_url(@order)
      flash[:error] = "Unable to change status."
    end
  end

  def index
    @orders = current_user.orders.page params[:page]
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
