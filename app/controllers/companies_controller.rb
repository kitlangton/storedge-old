class CompaniesController < InheritedResources::Base

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
