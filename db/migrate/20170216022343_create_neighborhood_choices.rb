class CreateNeighborhoodChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhood_choices do |t|
      t.integer :neighborhood_id
      t.integer :user_id

      t.timestamps
    end
  end
end
