require "test_helper"

class AdminControlOrdersDashboardTest < ActionDispatch::IntegrationTest
  test "admin visits dashboard and sees a list of orders and status totals" do
    When I visit the dashboard
      Then I can see a listing of all orders
      And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
      And I can see a link for each individual order
      And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
      And I have links to transition the status
        - I can click on "cancel" on individual orders which are "paid" or "ordered"
        - I can click on "mark as paid" on orders that are "ordered"
        - I can click on "mark as completed" on orders that are "paid"

  end

  test "admin filters orders by status type and transitions status" do

  end
end
