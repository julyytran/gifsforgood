require 'test_helper'

class UserCanViewARetiredGifTest < ActionDispatch::IntegrationTest
  test "user can not add a retired gif to cart" do
    user = create(:user)
    gif = Gif.create(title: "Hamster Dance",
                     description: "super sweet",
                     price: 100,
                     image: "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png",
                     retired:true
    )
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    order = user.orders.create(total_price: 100, status: "completed")
    order_gif = order.order_gifs.create(gif_id: gif.id, quantity: 1, subtotal: 100)

    visit order_path(order.id)

    click_link gif.title
    refute page.has_button? "Add to cart"
  end
end
