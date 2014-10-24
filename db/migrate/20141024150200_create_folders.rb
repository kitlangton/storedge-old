class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.references :company, index: true
      t.string :ancestry

      t.timestamps
    end
    add_index :folders, :ancestry
  end
end
