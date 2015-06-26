class Company < ActiveRecord::Base
  mount_uploader :brand_image, BrandImageUploader
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  paginates_per 12
  has_many :products
  has_many :users
  has_many :folders
  has_many :orders

  validates :name, presence: true, uniqueness: true

  def csrs
    users.select(&:csr?)
  end

end
