class CreateItems < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :brand_category_id, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :in_stock, default: 0
      t.integer :minimum_required_stock, default: 0
      t.integer :procurement_time_in_weeks, default: 0
      t.string :quantity
      t.timestamps
    end
    add_foreign_key :items, :brand_categories, column: :brand_category_id
    add_index :items, :brand_category_id
  end
end
