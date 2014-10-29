class FoldersController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @folder = Folder.new(parent_id: params[:parent_id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @folder = Folder.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @folder = @company.folders.new(folder_params)
    @folder.parent_id = params[:parent_id]
    if @folder.save
      if @folder.parent
        redirect_to company_folder_path(@company,@folder.parent)
      else
        redirect_to @folder.company
      end
    end
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      puts params
      redirect_to (company_folder_path(@folder.company,@folder.parent) || @folder.company)
    else
      render 'edit'
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    if @folder.destroy
      render nothing: true
      flash[:success] = "Company destroyed"
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
      add_breadcrumb parent.name , company_folder_path(@company,parent)
    end
    add_breadcrumb @folder.name , company_folder_path(@company,@folder)
  end

  private

  def folder_params
    params.require(:folder).permit(:name,:parent_id, :company_id)
  end
end
