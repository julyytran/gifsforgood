class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = current_user.orders.new
    @gifs = @cart.gifs
  end

  def create
    @order = current_user.orders.new
    if @order.save
    session[:order] = @cart.contents
    flash[:success] = "Order Created"
    redirect_to order_path(@order)
    end
  end
end
