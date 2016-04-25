Rails.application.routes.draw do
  devise_for :users
  resources :decks, :only => [:new, :create, :show]

  root 'site#index'

end
