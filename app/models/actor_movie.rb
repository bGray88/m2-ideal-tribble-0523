class ActorMovie < ApplicationRecord
  belongs_to :actor
  belongs_to :movie

  def self.create_relationship(actor_id, movie_id)
    self.create(actor_id: actor_id, movie_id: movie_id)
  end
end