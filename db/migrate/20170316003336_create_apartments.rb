class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|

      t.timestamps
    end
  end
end
