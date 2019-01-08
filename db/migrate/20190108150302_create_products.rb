class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, null: false, precision: 11, scale: 2
      t.integer :inventory_count, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
