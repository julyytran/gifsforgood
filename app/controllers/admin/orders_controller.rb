class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
    @grid = OrdersGrid.new(params[:orders_grid]) do |scope|
      scope.page(params[:page])
    end
  end
end
