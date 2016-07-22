class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    elsif user.nil?
      flash[:error] = "Username '#{params[:sessions][:username]}' not found. Please register below."
      redirect_to new_user_path
    else
      flash[:error] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end
end
