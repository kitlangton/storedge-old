class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.accessible_by(current_ability).page params[:page]
  end
end
