Rails.application.routes.draw do
  resources :cats , only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
end
