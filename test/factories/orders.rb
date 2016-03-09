FactoryGirl.define do
  factory :order do
    total_price 1000
    status "Pending"
  end
end
