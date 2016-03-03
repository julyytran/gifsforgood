class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @gifs = @cart.gifs
  end

  def create
    @order = Order.new
    @order.save
    session[:order] = @cart.contents
    flash[:success] = "Order Created"
    redirect_to order_path(@order)
  end
end
