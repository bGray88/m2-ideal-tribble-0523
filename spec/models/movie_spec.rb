require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many :actors }
  end

  describe 'methods' do
    before(:each) do
      @studio_1 = FactoryBot.create(:studio)

      @movie_1 = FactoryBot.create(:movie, studio: @studio_1)

      @actor_1 = FactoryBot.create(:actor, age: 65)
      @actor_2 = FactoryBot.create(:actor, age: 24)
      @actor_3 = FactoryBot.create(:actor, age: 28)

      @actor_1.movies << @movie_1
      @actor_2.movies << @movie_1
      @actor_3.movies << @movie_1
    end

    describe '#average_age_actors' do
      it 'returns the average age of all actors on movie' do
        expect(@movie_1.average_age_actors.round(2)).to eq(39)
      end
    end
  end
end
