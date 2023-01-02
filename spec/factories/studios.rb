FactoryBot.define do
  factory :studio do
    name {Faker::Hobby.activity}
    location {Faker::Address.city}
  end
end
