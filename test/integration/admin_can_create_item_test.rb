require "test_helper"

class AdminCanCreateItemTest < ActionDispatch::IntegrationTest
  test "admin can create multiple item with mutliple tags" do
    create_and_return_admin

    visit admin_dashboard_path
    click_on "Add New Gif"

    fill_in "Title", with: "all of teh lulz"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    fill_in "Image", with: "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif"

    click_on "add new gif!"

    assert page.has_content? "all of teh lulz"

    visit tags_path

    assert page.has_content? "lulzy"
    assert page.has_content? "defeated"
    assert page.has_content? "dusty"
  end
end
