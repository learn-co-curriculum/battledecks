require 'rails_helper'

RSpec.describe PresentationsController, type: :controller do
  let(:two_player_tournament){create(:active_tournament)}

  describe "GET #new" do
    it "returns http success" do
      get :new, :tournament_id => two_player_tournament.id, 
                :match_id => two_player_tournament.matches.first.id
      
      expect(response).to have_http_status(:success)
    end
  end
end
