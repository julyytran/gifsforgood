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
    @gifs_quant = ids.map do |id, quantity|
      [Gif.find(id.to_i), quantity]
    end.to_h
  end

  def destroy
    gif = Gif.find(params[:id])
    @cart.remove(gif.id)
    flash[:success] = "Successfully removed license for
    #{view_context.link_to gif.title, gif_path(gif.id)}"
    if @cart.contents.empty?
      redirect_to gifs_path
    else
      redirect_to cart_path
    end
  end

  def update
    gif = Gif.find(params["id"])
    quantity = params[params["id"]].values.first.to_i
    @cart.contents[params[:id]] = quantity
    redirect_to cart_path
    flash[:success] = "Successfully updated quantity for #{gif.title} to #{quantity}"
  end
end
