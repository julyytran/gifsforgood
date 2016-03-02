class CartGifsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    gif = Gif.find(params[:gif_id])
    @cart.add_gif(gif.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You added #{pluralize(@cart.count_of(gif.id), "license")} for #{gif.title}"
    redirect_to gifs_path
  end
end
