Rails.application.routes.draw do
  devise_for :users
  resources :cats do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:edit, :update, :destroy]
  root "cats#index"
end
