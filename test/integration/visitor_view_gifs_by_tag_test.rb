require "test_helper"

class VisitorViewGifsByTagTest < ActionDispatch::IntegrationTest
  test 'visitor views a tag page and sees all gifs in that tag' do
    gif_1 = create(:gif)
    gif_2 = create(:gif)
    gif_1.tags.create(name: "animated")
    gif_2.tags.create(name: "groups")

    visit "/animated"

    assert page.has_content?(gif_1.title)
    assert page.has_css?("img[src='#{gif_1.image}']")
    refute page.has_content?(gif_2.title)

    visit "/groups"

    assert page.has_content?(gif_2.title)
    assert page.has_css?("img[src='#{gif_2.image}']")
    refute page.has_content?(gif_1.title)
  end

  test "visitor can see a gif with multiple tags on all tag pages" do
    gif_1 = create(:gif)
    gif_1.tags.create(name: "animated")
    gif_1.tags.create(name: "cute")

    visit "/animated"

    assert page.has_content?(gif_1.title)
    assert page.has_css?("img[src='#{gif_1.image}']")

    visit "/cute"

    assert page.has_content?(gif_1.title)
    assert page.has_css?("img[src='#{gif_1.image}']")
  end
end
