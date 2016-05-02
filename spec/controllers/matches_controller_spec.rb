require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  let(:two_player_tournament){create(:active_tournament)}

  describe "GET #show" do
    it "returns http success" do
      sign_in(:user, create(:user))

      get :show, :tournament_id => two_player_tournament.id, 
                 :id => two_player_tournament.matches.first.id

      expect(response).to have_http_status(:success)
    end
  end

end
