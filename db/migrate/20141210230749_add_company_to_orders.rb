class AddCompanyToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :company, index: true
  end
end
