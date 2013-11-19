class UsersController < ApplicationController

  before_filter :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(username: params[:username])
    @posts = @user.posts
  end

  def edit
  end

  def update
    
    if @user.update(username: params[:username], password: params[:password])
      flash[:notice] = "Your profile has been updated"
      redirect_to show_profile_path(@user.username)
    else
      render edit_profile_path(@user)
    end
  end

  def create
    @user = User.new(username: params[:username], password: params[:password]) 
    if passwords_match?
      if @user.save
        flash[:notice] = 'Your account has been created!'
        redirect_to posts_path
      else
        @user.errors[:something] << 'went completely wrong'
        render :new
      end
    else
      @user.errors[:passwords] << 'do not match!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end