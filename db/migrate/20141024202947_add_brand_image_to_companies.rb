class AddBrandImageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :brand_image, :string
  end
end
