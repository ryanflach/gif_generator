class GifsController < ApplicationController
  before_action :verify_logged_in, only: [:create]

  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @user = current_user
    gif = Gif.find(params[:id])
    if @user.favorites << gif
      flash[:success] = "Added GIF to favorites"
      redirect_to @user
    else
      flash[:error] = "GIF is already favorited"
      redirect_to root_path
    end
  end
end
