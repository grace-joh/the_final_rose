require 'rails_helper'

RSpec.describe 'the Bachelorette Contestants index page' do
  before(:each) do
    test_data
  end

  describe 'User Story 2' do
    it 'displays all contestants details' do
      @bach1.contestants.each do |contestant|
        visit bachelorette_contestants_path(@bach1)

        within("#contestant-#{contestant.id}") do
          expect(page).to have_link(contestant.name)
          expect(page).to have_content("Age: #{contestant.age}")
          expect(page).to have_content("Hometown: #{contestant.hometown}")

          click_link(contestant.name)

          expect(current_path).to eq(contestant_path(contestant))
        end
      end

      expect(page).to_not have_content(@scott.name)

      visit bachelorette_contestants_path(@bach2)

      within("#contestant-#{@scott.id}") do
        expect(page).to have_link(@scott.name)
        expect(page).to have_content("Age: #{@scott.age}")
        expect(page).to have_content("Hometown: #{@scott.hometown}")

        click_link(@scott.name)

        expect(current_path).to eq(contestant_path(@scott))
      end

      expect(page).to_not have_content(@pete.name)
    end
  end
end
