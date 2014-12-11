class AddCsrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :csr, :boolean
  end
end
