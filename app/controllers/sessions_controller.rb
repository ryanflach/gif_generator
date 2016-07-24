class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    else
      flash[:danger] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end
end
