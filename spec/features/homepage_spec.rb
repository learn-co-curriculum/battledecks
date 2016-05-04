require 'feature_helper'

RSpec.feature "Homepage", type: :feature do
  let!(:two_player){create(:active_tournament)}
  let!(:sixteen_player){create(:active_tournament, :player_size => 16)}

  context 'not logged in' do
    it 'shows the visitor upcoming matches' do
      visit root_path

      expect(page).to have_content("2 Upcoming")
    end

    it 'shows the visitor the marketing jumbotron' do
      visit root_path

      expect(page).to have_content("Challenge Your Presentation Abilities")
    end
  end

  # context 'logged in' do
  # end
end