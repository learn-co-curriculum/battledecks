class DecksController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      redirect_to @deck
    else
      render :new
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  private
    def deck_params
      params.require(:deck).permit(:name, :url)
    end

end
