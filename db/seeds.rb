10.times do
  Tag.create(name: Faker::Hipster.word)
end

20.times do
  gif = Gif.create(title: Faker::Lorem.sentence,
              description: Faker::Hacker.say_something_smart,
              price: 100,
              image: "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png"
              )
  gif.tags << Tag.all.shuffle.first
end
