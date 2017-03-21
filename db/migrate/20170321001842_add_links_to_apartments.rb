class AddLinksToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :link, :string
    add_column :apartments, :pic, :string
  end
end
