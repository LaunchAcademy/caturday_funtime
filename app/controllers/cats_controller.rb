class CatsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @cats = Cat.all
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
  end

  def edit
    @cat = current_user.cats.find(params[:id])
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_path
    else
      render :edit
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :description, :url)
  end
end
