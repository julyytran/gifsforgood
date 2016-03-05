class OrdersController < ApplicationController
  around_action :wrap_in_transaction, only: :create

  def index
    @orders = current_user.orders
  end

  def show
    if current_user.orders.find(params[:id])
      @order = Order.find(params[:id])
    end
  end

  def new
    if current_user
      @order = Order.new
      @cart_gifs = @cart.cart_gifs
    else
      flash[:info] = "Please login or create a new account before checking out."
      redirect_to login_path
    end
  end

  def create
    @user = current_user
    @order = OrderProcessor.new(@cart, @user).process_order
    session[:cart].clear
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
    # flash[:error] = "We're sorry, something weird happened. Please try your order again."
    # redirect_to cart_path
  end

private

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      ensure
        raise ActiveRecord::Rollback
      end
    end
  end
end
