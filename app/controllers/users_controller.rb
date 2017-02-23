class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
                    user_name: params[:user_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully Created User Account"
      redirect_to '/'
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
         @user = User.find(params[:id])
         @user.assign_attributes(
                                age: params[:age],
                                min_age: params[:min_age],
                                max_age: params[:max_age],
                                min_price: params[:min_price],
                                max_price: params[:max_price],
                                min_roommates: params[:min_roommates],
                                max_roommates: params[:max_roommates],
                                has_pets: params[:has_pets],
                                pets: params[:pets],
                                gender: params[:gender],
                                gender_pref: params[:gender_pref],
                                bio: params[:bio]
                                )
    if @user.save
      flash[:success] = "Successfully Updated User Account"
      redirect_to "/users/#{@user.id}"
    else
      flash[:warning] = "User info failed to save"
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/signup"
    flash[:warning] = "Account has been destroyed"
    redirect_to = "/signup"
  end

  # def neighborhoods
  #   @neighborhoods = Neighborhood.all
  #   @user = User.find(params[:id])
  # end
end
