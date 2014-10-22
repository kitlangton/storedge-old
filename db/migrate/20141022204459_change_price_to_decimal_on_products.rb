class ChangePriceToDecimalOnProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :price, :decimal, :precision => 10, :scale => 2
    end
  end
end
