require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio_1 = FactoryBot.create(:studio)
    @studio_2 = FactoryBot.create(:studio)

    @movie_1 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_2 = FactoryBot.create(:movie, studio: @studio_1)
    @movie_3 = FactoryBot.create(:movie, studio: @studio_2)
  end

  describe 'When I visit the studio index page' do
    it 'shows all of the studios including name and location' do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end

    it 'shows all of the studios including name and location' do
      visit "/studios"
      xpath = "\"studio-#{@studio_1.id}-movies\""

      within(:xpath, "//div[@id=#{xpath}]") do
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)
        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@movie_2.creation_year)
        expect(page).to have_content(@movie_2.genre)
        expect(page).to_not have_content(@movie_3.title)
      end
    end
  end
end
