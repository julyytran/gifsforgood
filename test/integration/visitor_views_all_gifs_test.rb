require "test_helper"

class VisitorViewsAllGifsTest < ActionDispatch::IntegrationTest
  test "visitor sees all gifs" do
    gif1 = create(:gif)
    gif2 = create(:gif)

    visit gifs_path

    assert page.has_css?("img[src='#{gif1.image}']")
    assert page.has_css?("img[src='#{gif2.image}']")
  end
end
