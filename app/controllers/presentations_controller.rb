class PresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tournament_and_match

  def new
    begin
      authorize @match, :upload_presentation?
    rescue Pundit::NotAuthorizedError
      flash[:error] = "You are not authorized to upload a presentation for this match."
      redirect_to tournament_match_path(@tournament, @match)
    end
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
