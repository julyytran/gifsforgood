class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new
  end

  def edit
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])
    if @gif.update(gif_params) || @gif
      redirect_to gif_path(@gif.id)
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

end

private

def gif_params
  params.require(:gif).permit(:title, :description, :price, :tag, :image, :retired)
end
