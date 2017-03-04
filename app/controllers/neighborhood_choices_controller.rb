class NeighborhoodChoicesController < ApplicationController
  before_action :authenticate_user! 

  def edit
    @user = User.find(params[:id])
    @neighborhood_choices = NeighborhoodChoice.new

    if current_user.id != @user.id
      redirect_to '/users'
    end
  end

  def update
     @user = User.find(params[:id])

     neighborhood_ids = params[:neighborhood][:id]
     neighborhood_ids.each do |neighborhood_id|
       NeighborhoodChoice.find_or_create_by(
                                            user_id: params[:user_id],
                                            neighborhood_id: neighborhood_id
                                            )
       # if it exists, update as well. iterate through to let users deselect.
     end

    redirect_to "/users/#{@user.id}"

     # @neighborhood_choices.each do |neighborhood_id|
     #   NeighborhoodChoice.create( neighborhood_id: neighborhood_id, user_id: @user.id )
       # if 
       #logic to only add neighborhoods that haven't already been saved 
     # end
  end
end
