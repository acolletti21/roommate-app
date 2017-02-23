class NeighborhoodChoicesController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     @neighborhood_ids = #code for neighborhood ids
     @neighborhood_ids.each do |neighborhood_id|
       NeighborhoodChoice.create( neighborhood_id: neighborhood_id, user_id: @user.id )
       #logic to only add neighborhoods that haven't already been saved 
     end
  end
end
