class CreateBrands < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :manufacturer
      t.string :manufacturer_email
      t.string :manufacturer_office
      t.timestamps
    end
    add_index :brands, :name, unique: true
  end
end