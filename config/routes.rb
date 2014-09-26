Rails.application.routes.draw do
  devise_for :users
  resources :cats do
    resources :reviews, only: [:create]
  end
  put "cats/:id/vote/:vote_value", to: "cats#vote", as: :cat_vote
  put "reviews/:id/vote/:vote_value", to: "reviews#vote", as: :review_vote
  resources :reviews, only: [:edit, :update, :destroy]
  root "cats#index"
end
