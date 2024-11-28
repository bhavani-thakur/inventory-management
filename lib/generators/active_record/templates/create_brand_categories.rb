class CreateBrandCategories < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :brand_categories do |t|
      t.string :name, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.string :description
      t.timestamps
    end
    add_foreign_key :brand_categories, :brands, column: :brand_id
    add_foreign_key :brand_categories, :categories, column: :category_id
    add_index :brand_categories, :brand_id
    add_index :brand_categories, :category_id
  end
end
