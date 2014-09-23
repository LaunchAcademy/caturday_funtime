Rails.application.routes.draw do
  devise_for :users
  resources :cats, only: [:index, :new, :create, :show]
  root "cats#index"
end
