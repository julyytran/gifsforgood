class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
    @grid = OrdersGrid.new(params[:orders_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    flash[:success] = "You have successfully updated Order#{@order.id} as #{params[:status]}"
    render :index
  end

  def show
    @order = Order.find(params[:id])
  end
end
