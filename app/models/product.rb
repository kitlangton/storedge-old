class Product < ActiveRecord::Base
  belongs_to :company
  acts_as_taggable
end
