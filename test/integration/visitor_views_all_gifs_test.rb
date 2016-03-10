require "test_helper"

class VisitorViewsAllGifsTest < ActionDispatch::IntegrationTest
  test "visitor sees all gifs" do
    gif1 = create(:gif)
    gif1.tags.find_or_create_by(name: "faves")

    visit gifs_path

    assert page.has_css?("img[src='#{gif1.image.url}']")
  end
end
