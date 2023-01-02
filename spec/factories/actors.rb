FactoryBot.define do
  factory :actor do
    name {Faker::Name.name}
    age {rand(16..75)}
  end
end
