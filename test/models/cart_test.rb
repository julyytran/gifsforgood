# require "test_helper"
#
# class CartTest < ActiveSupport::TestCase
#   test "add gif to cart increases contents" do
#     gif_1 = create(:gif)
#     cart = Cart.new
#     cart.add_gif(gif_1.id)
#
#     assert_equal 1, cart.contents.total
#
#     gif_2 = create(:gif)
#     cart.add_gif(gif_2.id)
#     cart.add_gif(gif_2.id)
#
#     assert_equal 3, cart.contents.total
#   end
#
#   test "add 2 of a gif increases count of gif" do
#     gif_1 = create(:gif)
#     cart = Cart.new
#     cart.add_gif(gif_1.id)
#
#     assert_equal 1, cart.count_of(gif_1.id)
#
#     gif_2 = create(:gif)
#     cart.add_gif(gif_2.id)
#     cart.add_gif(gif_2.id)
#
#     assert_equal 2, cart.count_of(gif_2.id)
#   end
# end
