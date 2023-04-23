require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it { should have_many :contestants }
  end

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe 'avg_contestant_age' do
      it 'returns the average age of contestants' do
        expect(@bach1.avg_contestant_age).to eq(31.7)
      end
    end
  end
end
