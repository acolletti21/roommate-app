class SessionsController < ApplicationController
 def new
end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Successfully logged in!"
      redirect_to "/users/#{user.id}/edit"
    else
      flash[:warning] = "Incorrect email or password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Successfully Logged Out"
    redirect_to '/login'
  end
end
