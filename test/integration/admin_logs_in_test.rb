require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard" do
    admin = User.create(username: "Brock", password: "password", role: "1")

    visit '/'
# save_and_open_page
    click_on "Login"

    fill_in "Username", with: "July"
    fill_in "Password", with: "password"

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    within ".login" do
      click_on "Login"
    end


    assert_equal "/admin/dashboard", current_path
  end
end
