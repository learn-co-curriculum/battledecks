class MatchesController < ApplicationController
  before_action :set_tournament_and_match
  
  def show
  end

  def update
    @match.update_status(params[:status])
    redirect_to tournament_round_path(@tournament, @match.round)
  end

  private
    def set_tournament_and_match
      @tournament= Tournament.find(params[:tournament_id])
      @match = @tournament.matches.find(params[:id])
    end
end
