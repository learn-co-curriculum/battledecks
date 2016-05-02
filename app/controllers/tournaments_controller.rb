class TournamentsController < ApplicationController
  before_action :authenticate_user!

  def index
    params[:scope] ||= "upcoming"

    @tournaments = if params[:scope] == "managing"
      current_user.managed_tournaments
    elsif params[:scope] == "playing"
      current_user.played_tournaments
    else
      Tournament.upcoming
    end
  end


  def new
    @tournament = current_user.managed_tournaments.build
  end

  def create
    @tournament = current_user.managed_tournaments.new(tournament_params)
    if @tournament.save
      redirect_to @tournament
    else
      flash.now[:error] = "Unable to create the tournament, error details below."
      render :new
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name, :player_ids_to_add => [])
    end

end
