require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
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
