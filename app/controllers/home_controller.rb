class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    company = current_user.company_list.first
    @products = Product.tagged_with(company, on: :companies)
  end
end
