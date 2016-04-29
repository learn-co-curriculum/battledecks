class VotesController < ApplicationController
  before_action :set_match
  
  def create
    @match.vote_for(params[:player_id], current_user)
    redirect_to tournament_match_path(@match.tournament, @match)
  end
end
