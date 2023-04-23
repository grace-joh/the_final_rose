require 'rails_helper'

RSpec.describe 'the Bachelorette Contestants index page' do
  before(:each) do
    test_data
  end

  describe 'User Story 2' do
    it 'displays all contestants details' do
      visit bachelorette_contestants_path(@bach1)

      within("#contestant-#{@pete.id}") do
        expect(page).to have_content(@pete.name)
        expect(page).to have_content("Age: #{@pete.age}")
        expect(page).to have_content("Hometown: #{@pete.hometown}")
      end

      within("#contestant-#{@brandon.id}") do
        expect(page).to have_content(@brandon.name)
        expect(page).to have_content("Age: #{@brandon.age}")
        expect(page).to have_content("Hometown: #{@brandon.hometown}")
      end

      expect(page).to_not have_content(@scott.name)

      visit bachelorette_contestants_path(@bach2)

      within("#contestant-#{@scott.id}") do
        expect(page).to have_content(@scott.name)
        expect(page).to have_content("Age: #{@scott.age}")
        expect(page).to have_content("Hometown: #{@scott.hometown}")
      end

      expect(page).to_not have_content(@pete.name)
    end
  end
end
