class GifsController < ApplicationController
  before_action :verify_logged_in, only: [:create, :destroy]

  def index
    @gifs = Gif.all
    @user = current_user
  end

  def create
    @user = current_user
    gif = Gif.find(params[:id])
    if FavoriteGif.find_by(user: @user, gif: gif)
      flash[:danger] = "GIF is already favorited"
      redirect_to root_path
    else
      @user.favorites << gif
      flash[:success] = "Added GIF to favorites"
      redirect_to @user
    end
  end

  def destroy
    @user = current_user
    gif = Gif.find(params[:id])
    FavoriteGif.find_by(user: @user, gif: gif).destroy
    flash[:success] = "GIF removed from favorites"
    redirect_to @user
  end
end
