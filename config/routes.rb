Rails.application.routes.draw do
  devise_for :users
  resources :cats, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  root "cats#index"
end
