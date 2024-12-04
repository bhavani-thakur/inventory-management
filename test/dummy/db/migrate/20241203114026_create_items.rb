class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :product_id, null: false
      t.float :price
      t.integer :minimum_required_stock, default: 0
      t.integer :quantity
      t.timestamps
    end
    add_foreign_key :items, :products, column: :product_id
    add_index :items, :product_id
  end
end
