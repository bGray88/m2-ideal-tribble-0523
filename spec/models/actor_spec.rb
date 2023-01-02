require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many :movies }
  end

  describe 'methods' do
    before(:each) do
      @actor_1 = FactoryBot.create(:actor, name: 'Tom', age: 55)
      @actor_2 = FactoryBot.create(:actor, name: 'Breanna', age: 22)
      @actor_3 = FactoryBot.create(:actor, name: 'Jim', age: 56)
      @actor_4 = FactoryBot.create(:actor, name: 'Jimmy', age: 28)
      @actor_5 = FactoryBot.create(:actor, name: 'Talula', age: 77)
    end

    describe '#sort' do
      it 'returns a sorted collection of actors' do
        expected = [@actor_2, @actor_4, @actor_1, @actor_3, @actor_5]
        
        expect(Actor.sort(:asc)).to eq(expected)
      end
    end
  end
end
