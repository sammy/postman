class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      flash[:notice] = 'You have logged in!'
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:alert] = 'Incorrect username or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out'
    redirect_to posts_path
  end

end