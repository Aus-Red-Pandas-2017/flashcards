class CardsController < ApplicationController

  def show
    deck = Deck.find(params[:deck_id])
    @card = deck.cards.find(params[:id])
    @correct = "you got it!" if params['t']
    @wrong = "you burn, try again" if params['f']

  end

end