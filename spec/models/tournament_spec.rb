require 'rails_helper'

RSpec.describe Tournament, type: :model do
  context 'players' do
    let!(:u1){User.create(:email => "player_1@battledecks.com", :password => "testtest")}
    let!(:u2){User.create(:email => "player_2@battledecks.com", :password => "testtest")}

    let!(:tournament_1){Tournament.create(:name => "Tournament 1")}
    let!(:tournament_2){Tournament.create(:name => "Tournament 2")}

    context 'querying players' do
      before do
        TournamentPlayer.create(:tournament => tournament_1, :player => u1)
        TournamentPlayer.create(:tournament => tournament_1, :player => u2)

        TournamentPlayer.create(:tournament => tournament_2, :player => u2)
      end

      it 'returns the players in the tournament' do
        expect(tournament_1.players).to include(u1)
        expect(tournament_1.players).to include(u2)
        expect(tournament_2.players).to include(u2)
      end

      it 'does not return the players not in the tournament' do
        expect(tournament_2.players).to_not include(u1)
      end
    end
    context 'adding players' do
      it 'allows you to add a player to a tournament' do
        tournament_1.add_player(u1)
        tournament_1.save

        expect(tournament_1.players).to include(u1)
      end

      it 'allows you to write player_ids to add to a tournament' do
        tournament_1.player_ids_to_add = [u1.id, u2.id]
        tournament_1.save

        expect(tournament_1.players).to include(u1)
        expect(tournament_1.players).to include(u2)
      end
    end
  end
end
