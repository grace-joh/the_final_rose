require 'rails_helper'

RSpec.describe 'the Bachelorette Contestants show page' do
  before(:each) do
    test_data
  end

  describe 'User Story 3' do
    it 'displays contestant name, season details, and outings' do
      visit contestant_path(@ben)

      expect(page).to have_content(@ben.name)
      expect(page).to have_content("Season #{@ben.season_number} - #{@ben.season_description}")
      expect(page).to have_content('Outings')
      @ben.outings.each do |outing|
        expect(page).to have_content(outing.name)
      end
    end
  end
end
