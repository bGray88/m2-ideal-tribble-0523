require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio_1 = FactoryBot.create(:studio)
    @studio_2 = FactoryBot.create(:studio)
  end

  describe 'When I visit the studio index page' do
    it 'shows all of the studios including name and location' do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end
  end
end