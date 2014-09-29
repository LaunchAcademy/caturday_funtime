class CatsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @cats = Cat.all.order(updated_at: :desc)
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user

    if @cat.save
      redirect_to cats_path
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @review = Review.new
    @vote = @cat.votes.find_or_initialize_by(user: current_user)
  end

  def edit
    @cat = current_user.cats.find(params[:id])
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "Cat Updated"
      redirect_to cat_path
    else
      render :edit
    end
  end

  def destroy
    @cat = current_user.cats.find(params[:id])
    if @cat.destroy
      flash[:notice] = "Cat Destroyed"
      redirect_to cats_path
    else
      flash[:alert] = "fael lol, try again wow"
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description, :url)
  end
end
