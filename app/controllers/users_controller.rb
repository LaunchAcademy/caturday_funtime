class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @cats = Cat.where(@user.id == params[:id])
    @reviews = Review.where(@user.id == params[:id])
  end
end
