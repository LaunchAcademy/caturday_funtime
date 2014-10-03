class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(review_params)
    @review.cat = @cat
    @review.user = current_user

    if @review.save
      if @cat.user.review_email
        ReviewMailer.new_review(@review).deliver
      end
      redirect_to cat_path(@review.cat)
    else
      @vote = @cat.votes.find_or_initialize_by(user: current_user)
      flash[:alert] = "fael review lol, try again wow"
      #render "cats/show"
      redirect_to cat_path(@review.cat)
    end
  end

  def edit
    @review = Review.authorized_find(current_user, params[:id])
  end

  def update
    @review = Review.authorized_find(current_user, params[:id])

    if @review.update(review_params)
      flash[:notice] = "Review updated"
      redirect_to cat_path(@review.cat)
    else
      flash[:alert] = "fael lol, try again wow"
      render 'edit'
    end
  end

  def destroy
    @review = Review.authorized_find(current_user, params[:id])

    if @review.destroy
      flash[:notice] = "Deleted review"
      redirect_to cat_path(@review.cat)
    else
      flash[:alert] = "fael lol, try again wow"
      redirect_to cat_path(@review.cat)
    end
  end

  private

  def review_params
    params.require(:review).permit(:review)
  end
end
