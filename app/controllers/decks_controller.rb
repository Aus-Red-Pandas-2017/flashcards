class DecksController < ApplicationController

  def index
   @decks = Deck.all
  end

  def show
    card = Card.where(deck_id: params[:id]).sample
    redirect_to url_for(:controller => :cards, :action => :show, :deck_id => params[:id], :id => card.id)
  end

end


