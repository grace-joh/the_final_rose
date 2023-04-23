require 'rails_helper'

RSpec.describe 'the Bachelorette show page' do
  before(:each) do
    @bach1 = Bachelorette.create(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')
    visit bachelorette_path(@bach1)
  end

  describe 'User Story 1' do
    it 'displays the bachelorette details' do
      expect(page).to have_content(@bach1.name)
      expect(page).to have_content("Season #{@bach1.season_number} - #{@bach1.season_description}")
    end

    it 'displays a link to the bachelorettes contestants index page' do
      expect(page).to have_link('See Contestants')

      click_link('See Contestants')

      expect(current_path).to eq(bachelorette_contestants_path(@bach1))
    end
  end
end