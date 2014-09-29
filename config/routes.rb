Rails.application.routes.draw do
  devise_for :users

  resources :cats do
    resources :reviews, only: [:create]
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy] do
    resources :votes, only: [:create, :update, :destroy]
  end

  root "cats#index"
end
