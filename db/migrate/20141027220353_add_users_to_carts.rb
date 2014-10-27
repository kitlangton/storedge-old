class AddUserToCarts < ActiveRecord::Migration
  def change
    add_reference :shopping_carts, :user, index: true
  end
end
