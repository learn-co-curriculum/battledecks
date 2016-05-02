require 'feature_helper'

RSpec.feature "Signing In", type: :feature do
  describe "the signin process", :type => :feature do
    let!(:player_1){create(:player)}

    it "signs me in" do
      visit new_user_session_path
      within("#new_user") do
        fill_in 'user_email', :with => player_1.email
        fill_in 'user_password', :with => 'testtest'
      end
      click_button 'Login'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
