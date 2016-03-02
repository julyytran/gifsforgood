require 'test_helper'

class VisitorCanRegisterAndLoginTest < ActionDispatch::IntegrationTest
  test "visitor can signup for account" do
    visit '/'

    click_on "SignUp"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    click_on "Create Account"

    assert page.has_content?("")
  end


  test "visitor can see their dashboard with a logout link" do
    user = User.create(username: "Brock", password: "password")
    visit '/'

    click_on "Login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert_equal "/dashboard", current_path

    assert page.has_content?("Logged in as #{user.username}")

    refute page.has_content?("Login")

    assert page.has_content?("Logout")
  end

  # And when I visit "/cart"
  # Then I should see all of the data that was there when I was not logged in
  # When I click "Logout"
  # Then I should see see "Login"
  # And I should not see "Logout"
end
