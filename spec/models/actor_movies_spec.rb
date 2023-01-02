require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'relationships' do
    it { should belong_to :actor }
    it { should belong_to :movie }
  end

  describe 'methods' do
    it 'associates movies and actors' do
      @studio_1 = FactoryBot.create(:studio)
      @actor_1 = FactoryBot.create(:actor)
      @movie_1   = FactoryBot.create(:movie, studio: @studio_1)
      @actor_1.movies << @movie_1

      @actor_movie_1 = ActorMovie.find_by(
        actor_id: @actor_1.id,
        movie_id: @movie_1.id
      )

      expect(@actor_movie_1.present?).to be true
      expect(@actor_movie_1.actor.name).to eq(@actor_1.name)
    end
  end
end