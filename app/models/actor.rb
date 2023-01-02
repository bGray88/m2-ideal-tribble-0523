class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.sort(direction)
    self.order(age: direction)
  end
end