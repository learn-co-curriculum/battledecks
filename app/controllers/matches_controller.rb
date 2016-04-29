class MatchesController < ApplicationController
  before_action :set_tournament_and_match
  
  def show
  end

  def edit
  end

  def update
    @match.update_status(params[:status])
    redirect_to tournament_round_path(@tournament, @match.round)
  end

end
