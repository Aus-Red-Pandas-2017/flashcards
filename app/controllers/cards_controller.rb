class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
    @correct = "you got it!" if params['t']
    @wrong = "you burn, try again" if params['f']
  end

#  def create
#    #post
#  end
#
#  def new
#    #get
#  end
#
#  def edit
#    #get
#
#  end

  def update
    #patch
    card = Card.find(params[:id])
    if card.answer == params[:guess]
      url = "/decks/#{card.deck_id}/cards/#{card.id}?t=1"
      redirect_to url, action: "show"
    else
      url = "/decks/#{card.deck_id}/cards/#{card.id}?f=1"
      redirect_to url, action: "show"
    end
  end

  def destroy
    #delete
  end

end