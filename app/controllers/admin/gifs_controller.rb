class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new
  end

end
