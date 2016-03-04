FactoryGirl.define do
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
end
