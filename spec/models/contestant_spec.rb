require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end

  describe 'class methods' do
    before(:each) do
      test_data
    end

    describe 'average_age' do
      it 'returns the average age of contestants' do
        expect(Contestant.average_age).to eq(31.3)
      end
    end

    describe 'unique_hometown_list' do
      it 'returns the average age of contestants' do
        expect(Contestant.unique_hometown_list).to eq(['Irving, TX', 'Los Angeles, CA', 'Denver, CO'])
      end
    end

    describe 'unique_city_list' do
      it 'returns the average age of contestants' do
        expect(Contestant.unique_city_list).to eq(['Irving', 'Los Angeles', 'Denver'])
      end
    end
  end

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe 'season_number' do
      it 'returns its bachelorettes season number' do
        expect(@pete.season_number).to eq(@bach1.season_number)
        expect(@scott.season_number).to eq(@bach2.season_number)
      end
    end

    describe 'season_description' do
      it 'returns its bachelorettes season description' do
        expect(@pete.season_description).to eq(@bach1.season_description)
        expect(@scott.season_description).to eq(@bach2.season_description)
      end
    end
  end
end
