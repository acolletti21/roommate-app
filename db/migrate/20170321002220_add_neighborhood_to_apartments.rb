class AddNeighborhoodToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :neighborhood, :string
  end
end
