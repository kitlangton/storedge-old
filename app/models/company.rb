class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  paginates_per 12
  has_many :products
  has_many :users
  has_many :folders

  validates :name, presence: true, uniqueness: true
end
