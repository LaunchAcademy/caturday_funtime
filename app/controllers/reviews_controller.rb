class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(review_params)
    @review.cat = @cat
    @review.user = current_user

    if @review.save
      redirect_to cat_path(@review.cat)
    else
      flash[:alert] = "fael review lol, try again wow"
      redirect_to cat_path(@review.cat)
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "Review updated"
      redirect_to cat_path(@review.cat)
    else
      flash[:alert] = "fael lol, try again wow"
      render 'edit'
    end
  end

  def vote
    review = Review.find(params[:id])
    @vote = review.votes.find_or_initialize_by(user: current_user)

    if params[:vote_value].to_i == @vote.value
      @vote.delete
    else
      @vote.value = params[:vote_value] || 0
      @vote.save
    end

    redirect_to cat_path(review.cat)
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
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
