require 'rails_helper'

RSpec.describe 'the movie show' do
  before(:each) do
    @studio_1 = FactoryBot.create(:studio)
    @studio_2 = FactoryBot.create(:studio)

    @movie_1 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_2 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_3 = FactoryBot.create(:movie, studio: @studio_2)

    @actor_1 = FactoryBot.create(:actor, age: 55)
    @actor_2 = FactoryBot.create(:actor, age: 22)
    @actor_3 = FactoryBot.create(:actor, age: 77)
    @actor_4 = FactoryBot.create(:actor, age: 67)

    @actor_1.movies << @movie_1
    @actor_1.movies << @movie_2
    @actor_1.movies << @movie_3
    @actor_2.movies << @movie_2
    @actor_2.movies << @movie_3
    @actor_3.movies << @movie_1
    @actor_3.movies << @movie_2
    @actor_4.movies << @movie_3
  end

  describe 'When I visit a movie\'s show page' do
    it 'shows the movie\'s title, creation year, and genre' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
      expect(page).to_not have_content(@movie_2.title)
    end

    it 'shows a list of all its actors from youngest to oldest' do
      visit "/movies/#{@movie_3.id}"
      xpath = "\"movie-#{@movie_3.id}-actors\""

      within(:xpath, "//div[@id=#{xpath}]") do
        expect(page).to have_content(@actor_1.name)
        expect(page).to have_content(@actor_2.name)
        expect(@actor_1.name).to appear_before(@actor_4.name)
        expect(@actor_2.name).to appear_before(@actor_1.name)
      end
    end

    it 'shows the average age of all of the movie\'s actors' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.average_age_actors)
    end

    it 'does not show any actors listed that are not part of the movie' do
      visit "/movies/#{@movie_3.id}"

      expect(page).to_not have_content(@actor_3.name)
    end

    it 'has a form to add an actor to this movie' do
      visit "/movies/#{@movie_1.id}"
      xpath = "\"movie-#{@movie_1.id}-add-actors\""

      within(:xpath, "//div[@id=#{xpath}]") do
        fill_in('actor_id', with: @actor_2.id)
        click_button 'submit'
      end

      visit "/movies/#{@movie_1.id}"
      xpath = "\"movie-#{@movie_1.id}-actors\""

      within(:xpath, "//div[@id=#{xpath}]") do
        expect(page).to have_content(@actor_2.name)
      end
    end
  end
end