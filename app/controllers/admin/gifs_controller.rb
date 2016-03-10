class Admin::GifsController < Admin::BaseController
  def new
    @gif = Gif.new
    @charities = Charity.all
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      tags = params[:tags].split(",")
      @gif.create_tags(tags)
      if params[:charity]
        Charity.find_by(name: params[:charity]).gifs << @gif
      end
      flash[:success] = "Gif has been successfully added"
      redirect_to gif_path(@gif)
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_admin_gif_path
    end
  end

  def edit
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])
    if @gif.update(gif_params)
      if params[:tags]
        tags = params[:tags].split(",")
        @gif.create_tags(tags)
        # Tag.find_or_create_by(name: "#{params[:tags]}").gifs << @gif
      end
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
