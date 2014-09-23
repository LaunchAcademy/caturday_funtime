Rails.application.routes.draw do
  resources :cats , only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create]
  end
end
