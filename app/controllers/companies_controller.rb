class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companies = Company.all.page params[:page]
  end

  def new
    # @company = Company.new
    # authorize! :create, @company
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
      flash[:success] = "Company created"
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
