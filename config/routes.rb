Rails.application.routes.draw do
  resources :decks, :only => [:new, :create, :show]

  root 'site#index'

end
