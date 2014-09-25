Rails.application.routes.draw do
  devise_for :users
  resources :cats do
    resources :reviews, only: [:create]
  end
  root "cats#index"
end
