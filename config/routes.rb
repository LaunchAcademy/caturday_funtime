Rails.application.routes.draw do
  devise_for :users
  resources :cats, only: [:index, :new, :create, :show, :edit, :update] do
    resources :reviews, only: [:create]
  end
  root "cats#index"
end
