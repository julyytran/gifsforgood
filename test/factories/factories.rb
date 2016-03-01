FactoryGirl.define do
  factory :cart do
    
  end
  factory :tag do
    name { Faker::Hipster.word.capitalize }

    factory :tag_with_gifs do
      transient do
        gifs_count 2
      end

      after(:create) do | tag, evaluator|
        create_list(:gif, evaluator.gifs_count, tags: [tag])
      end
    end
  end

  factory :gif do
    title { Faker::Hacker.adjective.capitalize + " " + Faker::Hipster.word.capitalize }
    description { Faker::Hacker.say_something_smart.capitalize }
    price 100
    image "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png"

    factory :gif_with_tags do
      transient do
        tags_count 2
      end

      after(:create) do |gif, evaluator|
        create_list(:tag, evaluator.tags_count, gifs: [gif])
      end
    end
  end
end
