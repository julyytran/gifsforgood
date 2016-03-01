require "test_helper"

class FactoryTest < ActionDispatch::IntegrationTest
  test "sample factory test" do
    gif_1 = create(:gif)
    tag_1 = create(:tag)
    gif_1.tags << tag_1
    gif_1.tags << create(:tag)

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
    save_and_open_page
  end
end
