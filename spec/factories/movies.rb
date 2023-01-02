FactoryBot.define do
  factory :movie do
    title {Faker::Movie.title}
    creation_year {rand(1900..2020)}
    genre {Faker::Book.genre}
  end
end
