class NeighborhoodChoice < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhoods

  # accepts_nested_attributes_for :neighborhoods
end
