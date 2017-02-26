class Neighborhood < ApplicationRecord
  belongs_to :user
  has_many :neighborhood_choices
  has_many :users, through: :neighborhood_choices

end
