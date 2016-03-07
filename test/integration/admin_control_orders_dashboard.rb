require "test_helper"

class AdminControlOrdersDashboardTest < ActionDispatch::IntegrationTest
  test "admin visits dashboard  and clicks to view a list of orders and status totals" do
    create_and_return_admin
    create_multiple_orders(6)
    recent_order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"

    assert page.has_content? "All Orders for gifs_for_good"
    assert_equal admin_orders_path, current_path
    assert page.has_content? "Ordered: 6"
save_and_open_page


    assert page.has_link?("Order #{recent_order.id}", recent_order)



    assert_equal "Ordered: 6"


    # When I visit the dashboard
    #   Then I can see a listing of all orders
    #   And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
    #   And I can see a link for each individual order
    #   And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
    #   And I have links to transition the status
    #     - I can click on "cancel" on individual orders which are "paid" or "ordered"
    #     - I can click on "mark as paid" on orders that are "ordered"
    #     - I can click on "mark as completed" on orders that are "paid"

  end

  test "admin filters orders by status type and transitions status" do

  end
end
