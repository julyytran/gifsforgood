require 'test_helper'

class VisitorViewsAllGifsTest < ActionDispatch::IntegrationTest

  test "visitor sees all gifs" do
    gif = Gif.create(
      title: "hotline bling",
      description: "cuz I know when that hotline bling",
      price: 100,
      image: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

    visit gifs_path

    assert page.has_css?("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")
  end
end
