class CartGifsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    gif = Gif.find(params[:gif_id])
    @cart.add_gif(gif.id)
    session[:cart] = @cart.contents
    flash[:notice] =
      "You added #{pluralize(@cart.count_of(gif.id), 'license')} for #{gif.title}"
    redirect_to gifs_path
  end

  def show
    ids = session[:cart]
    @gifs = ids.map do |id, quantity|
      [Gif.find(id.to_i), quantity]
    end
  end

  def destroy
    gif = Gif.find(params[:id])
    @cart.contents.reject! { |gif_id| gif_id.to_i == gif.id }
    flash[:success] = "Successfully removed license for
    #{view_context.link_to gif.title, gif_path(gif.id)}"
    if @cart.contents.empty?
      redirect_to gifs_path
    else
      redirect_to cart_path
    end
  end

  def patch
    gif = Gif.find(params["id"])
    quantity = params[params["id"]].values.first.to_i
    @cart.contents[params[:id]] = quantity
    redirect_to cart_path
    flash[:success] = "Successfully updated quantity for #{gif.title} to #{quantity}"
  end
end
