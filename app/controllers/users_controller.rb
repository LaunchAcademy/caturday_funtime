class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_cats = @user.cats.order(created_at: :desc)
    @user_reviews = @user.reviews.order(created_at: :desc)
    @review_email = @user.review_email
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have set your review email option to #{@user.review_email}"
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:review_email)
  end

end
