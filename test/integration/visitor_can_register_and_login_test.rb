require 'test_helper'

class VisitorCanRegisterAndLoginTest < ActionDispatch::IntegrationTest
  test "visitor can signup for account" do
    visit '/'

    click_on "SignUp"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    click_on "Create Account"

    assert page.has_content?("Logged in as Brock")
  end


  test "visitor can see their dashboard with a logout link" do
    user = User.create(username: "Brock", password: "password")
    visit '/'

    click_on "Login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"
    click_on "Login"

    assert_equal "/dashboard", current_path

    assert page.has_content?("Logged in as #{user.username}")

    refute page.has_content?("Login")

    assert page.has_content?("Logout")
  end
end
