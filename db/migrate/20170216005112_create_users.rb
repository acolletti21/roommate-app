class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :age
      t.integer :min_age
      t.integer :max_age
      t.integer :min_price
      t.integer :max_price
      t.integer :min_roommates
      t.integer :max_roommates
      t.boolean :has_pets
      t.boolean :pets
      t.string :gender
      t.string :gender_pref
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.text :bio

      t.timestamps
    end
  end
end
