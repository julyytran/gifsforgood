require 'test_helper'

class AdminCanUpdateAGifTest < ActionDispatch::IntegrationTest
  test "admin sees gif with updated title" do
    create_and_return_admin
    gif = create(:gif, title: "Keri's gif")

    visit gif_path(gif.id)

    click_on "Edit"

    fill_in "Title", with: "Boulder Creek!"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    fill_in "Image", with: "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif"

    click_on "Update gif"

    assert page.has_content? "Boulder Creek!"
    refute page.has_content? "Keri's gif"
  end

  test "admin can retire a gif and still see it" do
    create_and_return_admin
    gif = create(:gif, title: "Da bomb")

    visit gif_path(gif.id)

    click_on "Edit"

    fill_in "Title", with: "Boulder Creek!"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    fill_in "Image", with: "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif"

  end
end
