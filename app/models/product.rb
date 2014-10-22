class Product < ActiveRecord::Base
  validates :company, presence: true
  belongs_to :company
end
