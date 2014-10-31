class ShoppingCartItem < ActiveRecord::Base
  validates :quantity, numericality:{ greater_than: 0, only_integers: true } 
  acts_as_shopping_cart_item
end
