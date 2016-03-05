require 'test_helper'

class AdminSeesAdminDashboardTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard" do
    admin = User.create(username: "July", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/dashboard"

    assert page.has_content? "Admin Dashboard"
  end

  test "registered user sees 404 when trying to visit admin dashboard" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

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
