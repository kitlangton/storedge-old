class AddFolderToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :folder, index: true
  end
end
