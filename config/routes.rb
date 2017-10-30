Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/decks' => 'decks#index'

  #get 'deck/:id' => 'cards#show'

  #get '/decks/:id/card/:id' => 'cards#show'
  resources :decks

  resources :decks do
    resources :cards
  end

end
