class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  validates :company, presence: true
  validates :price, presence: true
  validates :name, presence: true
  belongs_to :company
  belongs_to :folder
end
