class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  validates :company, presence: true
  belongs_to :company
end
