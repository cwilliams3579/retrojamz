Rails.application.routes.draw do
  resources :games
  root to: 'games#index'
  devise_for :users
  resources :users
end
