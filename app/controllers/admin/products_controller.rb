class Admin::ProductsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @product = Product.new(company_id: params[:company_id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      puts params
      if @product.folder
        redirect_to company_folder_path(@company,@product.folder)
      else
        redirect_to @product.company
      end
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      render nothing: true
    end
  end

  def index
    @products = Product.all.page params[:page]
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :company_id, :product_image, :folder_id)
  end
end
