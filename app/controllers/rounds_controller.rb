class RoundsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @tournament = Tournament.find(params[:tournament_id])
  end
end
