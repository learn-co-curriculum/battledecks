class PresentationsController < ApplicationController
  before_action :set_tournament_and_match

  def new
  end

  def create
    if @match.submit_presentation(current_user, presentation_params)
      redirect_to tournament_match_path(@tournament, @match)
    else
      render :new
    end
  end

  private
    def presentation_params
      params.require(:match).permit(:player_1_presentation_url, :player_2_presentation_url)
    end
end
