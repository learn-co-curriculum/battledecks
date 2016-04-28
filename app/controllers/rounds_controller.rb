class RoundsController < ApplicationController
  def show
    @tournament = Tournament.find(params[:tournament_id])
  end
end
