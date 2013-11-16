class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_categories, :current_user
  helper_method :logged_in?, :current_user

  def set_categories
    @categories = Category.all
  end

  def passwords_match?
    params[:password] == params[:password_confirmation]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You need to login to perform this action!!"
      redirect_to login_path
    end
  end

end
