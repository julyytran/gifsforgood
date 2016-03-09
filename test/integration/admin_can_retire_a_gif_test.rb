require 'test_helper'

class AdminCanRetireAGifTest < ActionDispatch::IntegrationTest
  test "admin can no longer find retired gif in gif index" do
    create_and_return_admin

    gif2 = create(:gif, title: "Lions")
    gif = create(:gif, title: "Geckos")

    visit gif_path(gif.id)
    click_on "Edit"

    click_on "Retire this Gif"

    refute page.has_content? "Add to cart"

    visit gifs_path
    refute page.has_content? gif.title
  end
end
