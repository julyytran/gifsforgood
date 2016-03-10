require "test_helper"

class AdminDeletesGifTest < ActionDispatch::IntegrationTest
  test "admin deletes a gif in its show view and is redirected to back to original page" do
    create_and_return_admin
    gif = create(:gif)
    gif.tags.create(name: "faves")
    visit gifs_path
    click_link gif.title

    assert page.has_content? ("Delete")
    click_on "Delete"
    assert_equal root_path, current_path
  end
end
