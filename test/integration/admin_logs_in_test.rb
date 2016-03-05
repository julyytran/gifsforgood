require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard" do
    admin = User.create(username: "July", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    assert_equal "/admin/dashboard", current_path
    assert page.has_content? "Welcome, July"
  end
end
