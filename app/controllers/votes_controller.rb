class VotesController < ApplicationController

  def create
    @match = Match.find(params[:match_id])
    @match.vote_for(params[:player_id], current_user)
    redirect_to tournament_match_path(@match.tournament, @match)
  end
end
