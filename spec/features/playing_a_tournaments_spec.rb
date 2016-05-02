require 'feature_helper'

RSpec.feature "Playing a Tournament", type: :feature do
  let!(:tournament){create(:active_tournament)}
  let!(:player_1){tournament.players[0]}
  let!(:player_2){tournament.players[1]}
  let!(:match_1){tournament.matches.first}

  describe 'uploading a presentation to a current match' do
    it 'only players in the tournament can upload a presentation' do
      login_as(player_1, :scope => :user)

      visit tournament_match_path(tournament, match_1)
      within "#presentation_player_1" do
        expect(page).to have_content("Upload Your Video")
        click_link "Upload Your Video"
      end
      
      fill_in "match_player_1_presentation_url", :with => "https://www.youtube.com/watch?v=JAMXn6EPe40"
      click_button "Upload Presentation"

      within "#presentation_player_1" do
        expect(page).to_not have_content("Upload Your Video")        
      end
    end

    it 'does not allow other users see the option to upload a video' do
      login_as(create(:user), :scope => :user)
      visit tournament_match_path(tournament, match_1)
      within "#presentation_player_1" do
        expect(page).to_not have_content("Upload Your Video")        
      end      
    end

    it 'redirects other users on the presentations upload for a match' do
      login_as(create(:user), :scope => :user)
      visit new_tournament_match_presentation_path(tournament, match_1)

      expect(page).to have_content "You are not authorized to upload a presentation for this match."
    end
  end
  
end
