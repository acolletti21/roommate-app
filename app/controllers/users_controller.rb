class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :profile_check!, only: [:index]

    def self.all_except(user)
   where.not(id: user)
  end

  def index
    @users = User.sorted_by_percent(current_user)
    neighborhood_type = params[:neighborhood]
    neighborhood = params[:neighborhood]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search_term]


    if neighborhood_type
      neighborhood = Neighborhood.find_by(name: neighborhood_type)
      @users = neighborhood.users
    end

    if sort_attribute && sort_order
      @users = User.all
      @users = @users.order(sort_attribute => sort_order)
    elsif sort_attribute
      @users = User.all
      @users = @users.order(sort_attribute)
    end  

    if search_term
      @users = User.all
      @users = @users.where("user_name iLIKE ? OR bio iLIKE ?",
                                  "%#{search_term}%",
                                  "%#{search_term}%")
    end
  end

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
      redirect_to "/users/#{@user.id}/edit"
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
     def compare_answers(other_user)
      user = User.find(id)
      answers_in_common = user.id & other_user.id
    end
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
                                bio: params[:bio],
                                facebook: params[:facebook],
                                twitter: params[:twitter],
                                google_plus: params[:google_plus],
                                linkedin: params[:linkedin],
                                phone: params[:phone]
                                )
    if @user.save
      flash[:success] = "Successfully Updated User Account"
      redirect_to "/users/#{@user.id}/edit/neighborhoods"
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
