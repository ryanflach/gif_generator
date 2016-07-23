class UsersController < ApplicationController
  before_action :assign_user, except: [:new, :create]
  before_action :verify_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to gifs_path
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def assign_user
    @user = current_user
  end
end
