class CreateCategories < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
