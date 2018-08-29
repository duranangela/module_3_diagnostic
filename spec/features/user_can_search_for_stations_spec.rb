require 'rails_helper'

describe "User can visit root path" do
  it "can search by zipcode" do
      visit "/"

      fill_in :q, with: '80203'
      click_on 'Locate'

      expect(current_path).to eq('/search')
      expect(page).to have_content('Name')
      expect(page).to have_content('Address')
      expect(page).to have_content('Fuel Type')
      expect(page).to have_content('Distance')
      expect(page).to have_content('Access Times')
  end
end
