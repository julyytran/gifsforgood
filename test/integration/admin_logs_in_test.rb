require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard" do
    create_and_return_admin
    
    visit admin_dashboard_path

    assert_equal "/admin/dashboard", current_path
    assert page.has_content? "Welcome, July"
  end
end
