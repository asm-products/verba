class SessionsController < ApplicationController
  def new
    if session[:user_id].present?
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_post_path
    else
      flash.alert = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
