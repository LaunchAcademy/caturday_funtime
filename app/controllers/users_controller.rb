class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_cats = @user.cats.order(created_at: :desc)
    @user_reviews = @user.reviews.order(created_at: :desc)
  end

end
