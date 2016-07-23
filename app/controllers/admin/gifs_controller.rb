class Admin::GifsController < Admin::BaseController
  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(clean_gif_params)
    if @gif.save
      flash[:success] = "Gif added to '#{@gif.category.name}'"
      redirect_to admin_category_path(@gif.category)
    else
      flash[:error] = @gif.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    if @gif.category.gifs.count == 0
      @gif.category.destroy
      flash[:success] = "Gif removed from '#{@gif.category.name}'; empty category deleted"
    else
      flash[:success] = "Gif removed from '#{@gif.category.name}'"
    end
    redirect_to admin_categories_path
  end

  private

  def gif_params
    params.require(:gif).permit(:category, :category_id)
  end

  def clean_gif_params
    if gif_params[:category].empty?
      {image_path: image_url(Category.find(gif_params[:category_id]).name), category_id: gif_params[:category_id]}
    else
      {image_path: image_url(gif_params[:category]), category: Category.find_or_create_by(name: gif_params[:category])}
    end
  end
end
