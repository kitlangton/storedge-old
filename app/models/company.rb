class Company < ActiveRecord::Base
  mount_uploader :brand_image, BrandImageUploader
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  paginates_per 12
  has_many :products
  has_many :users
  has_many :folders

  validates :name, presence: true, uniqueness: true
end
