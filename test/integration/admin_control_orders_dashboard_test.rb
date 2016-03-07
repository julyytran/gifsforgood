require "test_helper"

class AdminControlOrdersDashboardTest < ActionDispatch::IntegrationTest
  test "admin visits dashboard  and clicks to view a list of orders and status totals" do
    create_and_return_admin
    create_multiple_orders(6)
    recent_order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"

    assert page.has_content? ".all_orders for gifs_for_good"
    assert_equal admin_orders_path, current_path
    assert page.has_content? "Ordered: 6"
    assert page.has_link?(recent_order.id, admin_order_path(recent_order))
  end

  test "admin filters orders by status type and transitions status" do

  end
end
