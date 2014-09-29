class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    voteable, cat = find_voteable
    vote = current_user.votes.build(vote_params)
    vote.voteable = voteable

    if vote.save
      flash[:notice] = "Successfully voted."
    else
      flash[:alert] = "Could not save your vote."
    end

    redirect_to cat
  end

  def update
    voteable, cat = find_voteable
    vote = voteable.votes.where(user: current_user).find(params[:id])

    if vote.update(vote_params)
      flash[:notice] = "Successfully voted."
    else
      flash[:alert] = "Could not save your vote."
    end

    redirect_to cat
  end

  def destroy
    voteable, cat = find_voteable
    vote = voteable.votes.where(user: current_user).find(params[:id])

    if vote.destroy
      flash[:notice] = "Vote cleared."
    else
      flash[:alert] = "Unable to clear vote."
    end

    redirect_to cat
  end

  private

  def find_voteable
    if params[:review_id]
      voteable = Review.find(params[:review_id])
      cat = voteable.cat
    elsif params[:cat_id]
      voteable = Cat.find(params[:cat_id])
      cat = voteable
    end

    [voteable, cat]
  end

  def vote_params
    params.require(:vote).permit(:value)
  end
end
