class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.where(company: current_user.company).page params[:page]
  end
end
