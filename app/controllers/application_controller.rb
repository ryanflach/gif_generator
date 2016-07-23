class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :verify_logged_in

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    render file: "public/404.html" unless current_user
  end
end
