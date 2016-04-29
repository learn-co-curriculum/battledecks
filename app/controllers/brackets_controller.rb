class BracketsController < ApplicationController
  before_action :set_tournament_and_bracket

  def new
    @bracket.generate_round(1)
  end

  def create
    @bracket.generate_round(1)    
    @bracket.generate_matches(1)
    redirect_to @tournament
  end

  def update
    @bracket.generate_round(params[:round])
    @bracket.generate_matches(params[:round])
    redirect_to @tournament
  end

end
