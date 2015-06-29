class Product < ActiveRecord::Base
  scope :published, -> { where(removed: false) }
  mount_uploader :product_image, ProductImageUploader
  validates :company, presence: true
  validates :price, presence: true
  validates :name, presence: true
  belongs_to :company
  belongs_to :folder

  def remove
    self[:removed] = true
    save
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
