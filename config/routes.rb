Rails.application.routes.draw do
  devise_for :users

  resources :decks, :only => [:new, :create, :show]
  resources :tournaments, :only => [:new, :create, :index, :show]

  root 'site#index'
end
