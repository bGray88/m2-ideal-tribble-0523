require 'rails_helper'

RSpec.describe 'the movie show' do
  before(:each) do
    @studio_1 = FactoryBot.create(:studio)
    @studio_2 = FactoryBot.create(:studio)

    @movie_1 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_2 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_3 = FactoryBot.create(:movie, studio: @studio_2)

    @actor_1 = FactoryBot.create(:actor)
    @actor_2 = FactoryBot.create(:actor)
    @actor_3 = FactoryBot.create(:actor)

    @actor_1.movies << @movie_1
    @actor_1.movies << @movie_2
    @actor_1.movies << @movie_3
    @actor_2.movies << @movie_2
    @actor_2.movies << @movie_3
    @actor_3.movies << @movie_1
    @actor_3.movies << @movie_2
  end

  describe 'When I visit a movie\'s show page' do
    it 'shows the movie\'s title, creation year, and genre' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end
  end
end