class AddOrderToShoppingCartItems < ActiveRecord::Migration
  def change
    add_reference :shopping_cart_items, :order, index: true
  end
end
