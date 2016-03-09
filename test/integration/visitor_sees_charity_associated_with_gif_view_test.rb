require 'test_helper'

class VisitorSeesCharityAssociatedWithGifViewTest < ActionDispatch::IntegrationTest
  test "visitor visits a gif show page and sees a charity associated with a gif" do
    charity = create(:charity)
    charity.gifs << create(:gif)
    gif = Gif.last
    visit gif_path(gif)

    assert page.has_content?(gif.title)
    assert page.has_content?("Purchase of this gif will support #{gif.charity.name}")
    assert page.has_css?("img[src='#{gif.charity.logo}']")
  end

  test "visitor sees charities on index page of all charities with links to view their gifs" do
    3.times do
      charity = create(:charity)
      charity.gifs << create(:gif)
    end

    visit charities_path

    Charity.all.each do  | charity |
      assert page.has_content?(charity.name)
      assert page.has_css?("img[src='#{charity.logo}']")
      assert page.has_link?(charity_path(charity))
    end

    id = Charity.first.id
    click_link Charity.first
    assert_equal "/charities/#{id}", current_path
  end
end
