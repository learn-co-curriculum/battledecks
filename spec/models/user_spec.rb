require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:u1){User.create(:email => "player_1@battledecks.com", :password => "testtest")}
  let!(:u2){User.create(:email => "player_2@battledecks.com", :password => "testtest")}

  context 'played_tournaments' do
    let!(:tournament_1){Tournament.create(:name => "Tournament 1")}
    let!(:tournament_2){Tournament.create(:name => "Tournament 2")}

    before do
      TournamentPlayer.create(:tournament => tournament_1, :player => u1)
      TournamentPlayer.create(:tournament => tournament_1, :player => u2)

      TournamentPlayer.create(:tournament => tournament_2, :player => u2)
    end


    it 'returns the tournaments that the user has played in' do
      expect(u1.played_tournaments).to include(tournament_1)
      expect(u2.played_tournaments).to include(tournament_1)
      expect(u2.played_tournaments).to include(tournament_2)
    end

    it 'does not return tournamnets the user has not played in' do
      expect(u1.played_tournaments).to_not include(tournament_2)
    end
  end
end
