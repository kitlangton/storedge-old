class FoldersController < ApplicationController

  def new
    @folder = Folder.new(parent_id: params[:parent_id])
    @company = Company.find(params[:format])
  end

  def create

    @folder = Folder.new(folder_params)
    @folder.company_id = params[:company_id]
    @folder.parent_id = params[:parent_id]
    if @folder.save
      redirect_to @folder.parent ||
        @folder.company
    end
  end

  def show
    add_breadcrumb "Companies", companies_path if current_user.try(:admin?)

    @folder = Folder.find(params[:id])
    @folders = @folder.children
    @company = @folder.company
    @products = @folder.products.page params[:page]

    add_breadcrumb @company.name , company_path(@company)
    @folder.ancestors.each do |parent|
      add_breadcrumb parent.name , folder_path(parent)
    end
    add_breadcrumb @folder.name , folder_path(@folder)
  end

  private

  def folder_params
    params.require(:folder).permit(:name,:parent_id)
  end
end
