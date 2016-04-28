Rails.application.routes.draw do
  get 'matches/show'

  get 'rounds/show'

  devise_for :users

  resources :decks, :only => [:new, :create, :show]
  resources :tournaments, :only => [:new, :create, :index, :show] do
    resource :bracket, :only => [:new, :create, :update]
    resources :rounds, :only => [:show]
    resources :matches, :only => [:show, :update] do
      resources :votes, :only => [:create]
    end
  end

  root 'site#index'
end
