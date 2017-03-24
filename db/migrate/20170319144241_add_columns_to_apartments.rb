class AddColumnsToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :address, :string
    add_column :apartments, :sqft, :integer
    add_column :apartments, :baths, :integer
    add_column :apartments, :rent, :integer
    add_column :apartments, :bedrooms, :integer
  end
end
