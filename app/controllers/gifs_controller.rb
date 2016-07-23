class GifsController < ApplicationController
  def index
  end

  def show
    @gif = Gif.find(params[:id])
  end
end
