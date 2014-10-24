class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :authenticate_user!
  before_action :redirect_to_home
  def show
    company = current_user.company
    @folders = Folder.where(company:company).roots
    @products = Product.where(company: company).page params[:page]
  end

  private

  def redirect_to_home
    if current_user.admin?
      redirect_to companies_path
    else
      redirect_to company_path(current_user.company)
    end
  end
end
