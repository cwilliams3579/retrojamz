Rails.application.routes.draw do
  root to: 'games#index'
  devise_for :users

  resources :games do
    # resources :reviews, except: [:index, :show]
    # resources :comments, :likes, only: [:create]
    # resources :likes, only: [:create]
    collection do
      get 'search'
    end
  end
end
