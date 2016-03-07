class CartGifsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    gif = Gif.find(params[:gif_id])
    @cart.add_gif(gif.id)
    session[:cart] = @cart.contents
    flash[:notice] =
      "You added #{pluralize(@cart.cart_gifs.first.quantity, 'license')} for #{gif.title}"
    redirect_to gifs_path
  end

  def show
    ids = session[:cart]
    @cart_gifs = @cart.cart_gifs
  end

  def destroy
    gif = find_gif
    @cart.remove_gif(gif.id)
    flash[:success] = "Successfully removed license for
    #{view_context.link_to gif.title, gif_path(gif.id)}"
    if @cart.contents.empty?
      redirect_to gifs_path
    else
      redirect_to cart_path
    end
  end

  def update
    gif = find_gif
    quantity = params[params[:id]].values.first.to_i
    @cart.contents[params[:id]] = quantity
    redirect_to cart_path
    flash[:success] = "Successfully updated quantity for #{gif.title} to #{quantity}"
  end
end
