class HomeController < ApplicationController
  before_action :authenticate_user!
  def show
    company = current_user.company
    @products = Product.where(company: company).page params[:page]
  end
end
