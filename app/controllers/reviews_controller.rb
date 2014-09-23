class ReviewsController < ApplicationController

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(review_params)
    @review.cat = @cat

    if @review.save
      redirect_to cat_path(@cat)
    else
      render 'cats/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:review)
  end
end
