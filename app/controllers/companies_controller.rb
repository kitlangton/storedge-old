class CompaniesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    redirect_to_home unless current_user.admin?
    add_breadcrumb "Companies", companies_path if current_user.try(:admin?)
    @companies = Company.all.page params[:page]
  end

  def edit
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      puts params
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  def show
    add_breadcrumb "Companies", root_path if current_user.try(:admin?)
    @company = Company.find(params[:id])
    @folders = @company.folders.roots
    @products = @company.products.published.where(folder:nil).page params[:page]

    add_breadcrumb @company.name, company_path(@company)
  end

  def new
    add_breadcrumb "Companies", companies_path if current_user.try(:admin?)
  end

  def create
    # @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
      flash[:success] = "Company created"
    else
      render 'new'
    end
  end

  def destroy
    if @company.destroy
      render nothing: true
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :brand_image)
  end

  def redirect_to_home
    if current_user.admin?
      redirect_to companies_path
    else
      redirect_to company_path(current_user.company)
    end
  end
end
