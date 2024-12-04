class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.string :description
      t.timestamps
    end
    add_foreign_key :products, :brands, column: :brand_id
    add_foreign_key :products, :categories, column: :category_id
    add_index :products, :brand_id
    add_index :products, :category_id
  end
end
