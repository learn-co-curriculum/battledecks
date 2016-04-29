Rails.application.routes.draw do
  get 'presentations/new'

  get 'presentations/create'

  get 'matches/show'

  get 'rounds/show'

  devise_for :users

  resources :decks, :only => [:new, :create, :show]
  resources :tournaments, :only => [:new, :create, :index, :show] do
    resource :bracket, :only => [:new, :create, :update]
    resources :rounds, :only => [:show]
    resources :matches, :only => [:show, :update, :edit] do
      resources :votes, :only => [:create]
      resources :presentations, :only => [:new, :create]
    end
  end

  root 'site#index'
end
