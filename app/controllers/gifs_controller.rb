class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def show
    @gif = find_gif
  end
end
