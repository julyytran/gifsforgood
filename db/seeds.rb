10.times do
  Tag.create(name: Faker::Hipster.word)
end

20.times do
  gif = Gif.create(title: Faker::Lorem.sentence,
              description: " adfg",
              price: 100,
              image: "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png"
              )
  gif.tags << Tag.all.shuffle.first
end

<<<<<<< HEAD

20.times do
  subtotal = Random.new.rand(1..10)
  user = User.create(username: "string", password: "password")
  gif = Gif.all.shuffle.first
  order = user.orders.create(total_price: 3*subtotal, status: "Ordered")
  order.order_gifs.create(
    gif_id: gif.id, quantity: 1, subtotal: subtotal
  )
  gif = Gif.all.shuffle.first
  order.order_gifs.create(
    gif_id: gif.id, quantity: 2, subtotal: subtotal*2
  )
end
=======
User.create(username: "Brian", password: "password", role: 1)
>>>>>>> development
