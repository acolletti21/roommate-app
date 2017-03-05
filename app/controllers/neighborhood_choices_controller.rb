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

    @user.neighborhood_choices.destroy_all
    neighborhood_ids = params[:neighborhood][:id]
      if neighborhood_ids 
        neighborhood_ids.each do |neighborhood_id|
          if neighborhood_id != nil
            NeighborhoodChoice.find_or_create_by(
                                              user_id: params[:user_id],
                                              neighborhood_id: neighborhood_id
                                              )
            
            end
          end
        flash[:success] = "Successfully Updated Neighborhoods"
        redirect_to "/users/#{@user.id}"
      else
      render :edit
    end
  end

end
