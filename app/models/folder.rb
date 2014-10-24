class Folder < ActiveRecord::Base
  has_ancestry
  has_many :products
  belongs_to :company
end
