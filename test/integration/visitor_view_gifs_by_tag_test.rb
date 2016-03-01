require 'test_helper'

class VisitorViewGifsByTagTest < ActionDispatch::IntegrationTest
  test 'visitor views a tag page and sees all gifs in that tag' do
    gif_1 = Gif.create(title: "LOL", description: "descriptive text", price: 100, image: "http://orig00.deviantart.net/73ba/f/2009/221/8/9/punkrock_kitty_animated_by_wikingerstn.gif")
    gif_2 = Gif.create(title: "more lols", description: "descriptive text", price: 100, image: "http://a5.files.magneticmag.com/image/upload/MTMzMDU3MDQ4NzkwMTgyNTMx.gif")
    gif_1.tags.create(name: "animated")
    gif_2.tags.create(name: "groups")

    visit '/animated'

    within '#gifs' do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
      refute page.has_content?(gif_2.title)
    end

    visit '/groups'

    within '#gifs' do
      assert page.has_content?(gif_2.title)
      assert page.has_css?("img[src='#{gif_2.image}']")
      refute page.has_content?(gif_1.title)
    end
  end

  test 'visitor can see a gif with multiple tags on all tag pages' do
    gif_1 = Gif.create(title: "LOL", description: "descriptive text", price: 100, image: "http://orig00.deviantart.net/73ba/f/2009/221/8/9/punkrock_kitty_animated_by_wikingerstn.gif")
    gif_1.tags.create(name: "animated")
    gif_1.tags.create(name: "cute")

    visit '/animated'

    within '#gifs' do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
    end

    visit '/cute'

    within '#gifs' do
      assert page.has_content?(gif_1.title)
      assert page.has_css?("img[src='#{gif_1.image}']")
    end
  end
end
