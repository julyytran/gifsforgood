class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def show
    @gif = find_gif
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      flash[:success] = "Gif has been successfully added"
      redirect_to admin_dashboard_path
    else
      render new_admin_gif_path
      flash.now[:error] = "Invalid Entry, Try again."
    end
  end
end
private

def gif_params
  params.require(:gif).permit(:title, :description, :price, :tag, :image)
end
