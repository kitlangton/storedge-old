class ProductsController < ApplicationController

  def new
    add_breadcrumb "Companies", companies_path if current_user.try(:admin?)

    @company = Company.find(params[:company_id])
    @product = Product.new(folder_id: params[:folder_id])

    add_breadcrumb @company.name , company_path(@company)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      puts params
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def create
    @company = Company.find(params[:company_id])
    @product = @company.products.new(product_params)
    if @product.save
      if @product.folder
        redirect_to company_folder_path(@company,@product.folder)
      else
        redirect_to @company
      end
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.remove
      ShoppingCartItem.where(item_id: @product.id, owner_type: "ShoppingCart").destroy_all
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
