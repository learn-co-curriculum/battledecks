class BracketsController < ApplicationController
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @bracket = BracketGenerator.new(@tournament)
    @bracket.generate_round(1)
  end
end
