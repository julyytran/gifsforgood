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

    within ".login" do
      click_on "Login"
    end

    assert_equal "/dashboard", current_path

    assert page.has_content?("Logged in as #{user.username}")

    refute page.has_content?("Login")

    assert page.has_content?("Logout")
  end

  test "visitor adds stuff to cart and still sees it upon login" do
    gif = create(:gif)
    visit gif_path(gif)
    click_button "Add to cart"

    user = User.create(username: "Brock", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit 'cart'
    assert_equal "/cart", current_path
    assert page.has_content?(gif.title)
    puts gif.image
    assert page.has_content?(gif.description)
  end
end
