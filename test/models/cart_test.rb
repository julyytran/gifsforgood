require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "add gif to cart increases contents" do
    gif_1 = create(:gif)
    cart = Cart.new({gif_1.id.to_s => 1})

    assert_equal 1, cart.total_items

    gif_2 = create(:gif)
    cart.add_gif(gif_2.id)

    gif_3 = create(:gif)
    cart.add_gif(gif_3.id)

    assert_equal 3, cart.total_items
  end

  test "add 2 of a gif increases count of gif" do
    gif_1 = create(:gif)
    cart = Cart.new({gif_1.id.to_s => 1})

    cart.add_gif(gif_1.id)

    gif_2 = create(:gif)
    cart.add_gif(gif_2.id)

    assert_equal 2, cart.count_of(gif_1.id)
    assert_equal 3, cart.total_items

  end

    test "gifs method returns gif objects" do
      gif_1 = create(:gif)
      gif_2 = create(:gif)
      cart = Cart.new({gif_1.id.to_s => 1})

      cart.add_gif(gif_2.id)

      cart_gifs = cart.gifs

      assert_equal Gif, cart_gifs.first.class
      assert_equal 2, cart_gifs.count
    end
end
