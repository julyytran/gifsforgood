FactoryGirl.define do
  factory :order_gif do
    quantity Random.new.rand(1..10)
    subtotal Random.new.rand(200..1200)
    after_create do |og|
      Factory(:order, :order_gifs => [og])
      Factory(:user, :order_gifs => [og])
    end
  end
end
