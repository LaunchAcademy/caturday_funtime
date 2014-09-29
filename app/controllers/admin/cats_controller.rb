class Admin::CatsController < ApplicationController
  before_filter :authorize!

  def index
    @cats = Cat.order(created_at: :desc)
  end

  def destroy
    cat = Cat.find(params[:id])
    if cat.destroy
      flash[:notice] = "monster vanquished!"
    else
      flash[:alert] = "This cat is unnnnndeletable! We're not sure why."
    end

    redirect_to cats_path
  end
end
