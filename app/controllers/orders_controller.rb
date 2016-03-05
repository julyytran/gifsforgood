class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart_gifs = @cart.cart_gifs
  end

  def create
    @user = current_user
    @order = OrderProcessor.new(@cart, @user).process_order
    if @order.save
      flash[:success] = "Order was successfully placed."
      redirect_to orders_path
    else
      flash[:error] = "We're sorry, something weird happened. Please try your order again."
      redirect_to "/cart"
    end
  end
end
