require "test_helper"

class AdminCanCreateItemTest < ActionDispatch::IntegrationTest
  test "admin can create an item" do
    skip
    create_and_return_admin

    visit "/gifs"

    click_on "New Item"

    fill_in "title", with: "all of teh lulz"
    fill_in "description", with: "this is all the lulz you could imagine!!"
    fill_in "price", with: "100"
    fill_in "tags", with: "lulzy" #HOW TO FILL IN MULTIPLE TAGS???
    fill_in "image", with: "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif"

    click_on "Create Item"

    assert page.has_content? "all of teh lulz"
    assert page.has_content? "this is all the lulz you could imagine!!"
    assert page.has_content? "$1.00"
    assert page.has_content? "Tags: lulzy"
    assert page.has_css?("img[src='http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif']")
  end
end
