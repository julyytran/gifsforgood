require "test_helper"

class VisitorViewGifsByTagTest < ActionDispatch::IntegrationTest
  test 'visitor views a tag page and sees all gifs in that tag' do
    gif_1 = Gif.create(title: "LOL", description: "descriptive text", price: 100, image: "http://orig00.deviantart.net/73ba/f/2009/221/8/9/punkrock_kitty_animated_by_wikingerstn.gif")
    gif_2 = Gif.create(title: "more lols", description: "descriptive text", price: 100, image: "http://a5.files.magneticmag.com/image/upload/MTMzMDU3MDQ4NzkwMTgyNTMx.gif")
    gif_1.tags.create(name: "animated")
    gif_2.tags.create(name: "groups")

    visit "/animated"

    within "#gifs" do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
      refute page.has_content?(gif_2.title)
    end

    visit "/groups"

    within "#gifs" do
      assert page.has_content?(gif_2.title)
      assert page.has_css?("img[src='#{gif_2.image}']")
      refute page.has_content?(gif_1.title)
    end
  end

  test "visitor can see a gif with multiple tags on all tag pages" do
    gif_1 = Gif.create(title: "LOL", description: "descriptive text", price: 100, image: "http://orig00.deviantart.net/73ba/f/2009/221/8/9/punkrock_kitty_animated_by_wikingerstn.gif")
    gif_1.tags.create(name: "animated")
    gif_1.tags.create(name: "cute")

    visit "/animated"

    within "#gifs" do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
    end

    visit "/cute"

    within "#gifs" do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
    end
  end

  test "sample factory test" do
    gif_1 = create(:gif)
    tag_1 = create(:tag)
    gif_1.tags << tag_1
    gif_1.tags << create(:tag)
    gif_1.tags

    assert_equal 2, gif_1.tags.count

    visit "/#{tag_1.name}"
    assert page.has_content?(gif_1.title)

    gif_override = Gif.create(attributes_for(:gif, title: "I <3 July"))
    assert_equal "I <3 July", gif_override.title

    gif_2_tags = create(:gif_with_tags)
    assert_equal 2, gif_2_tags.tags.count

    gif_4_tags = create(:gif_with_tags, tags_count: 4)
    assert_equal 4, gif_4_tags.tags.count

    tag_with_2_gifs = create(:tag_with_gifs)
    tag_with_20_gifs = create(:tag_with_gifs, gifs_count: 20)

    visit "/#{tag_with_20_gifs.name}"
  end
end
