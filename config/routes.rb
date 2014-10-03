Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update]

  resources :cats do
    resources :reviews, only: [:create]
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy] do
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :search, only: [:index]

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  resources :categories, only: [:index, :show, :destroy]

  root "cats#index"

  resources :about, only: [:index]
end
