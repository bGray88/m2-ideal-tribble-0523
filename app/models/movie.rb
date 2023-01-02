class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def average_age_actors
    self.actors.average(:age).to_f
  end

  def sort(direction)
    actors.order(age: direction)
  end
end
