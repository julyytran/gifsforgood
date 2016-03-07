require 'test_helper'

class AdminSeesAdminDashboardTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard" do
    create_and_return_admin

    visit "/admin/dashboard"

    assert page.has_content? "Admin Dashboard"
  end

  test "registered user sees 404 when trying to visit admin dashboard" do
    create_and_login_user
    
    visit "/admin/dashboard"

    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("The page you were looking for doesn't exist")
  end

  test "unregistered user sees 404 when trying to visit admin dashboard" do
    visit "/admin/dashboard"

    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
