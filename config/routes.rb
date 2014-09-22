Rails.application.routes.draw do
  resources :cats, only: [:index]
end
