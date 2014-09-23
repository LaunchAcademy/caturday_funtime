class ReviewsController < ApplicationController

  def new
    @cat = Cat.find(params[:cat_id])
    @review = Review.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(review_params)
    @review.cat_id = @cat.id

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
