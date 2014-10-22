class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companies = Company.all.page params[:page]
  end

  def new
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
      flash[:success] = "Company destroyed"
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
