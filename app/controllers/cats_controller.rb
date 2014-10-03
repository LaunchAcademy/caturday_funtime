class CatsController < ApplicationController
  CATS_PER_PAGE = 9

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @cats = Cat.includes(:user, :votes).order(created_at: :desc).page(params[:page]).per(CATS_PER_PAGE)

    @top_cats = {}
    top_cats_calc = ActiveRecord::Base.connection.execute(
      "SELECT voteable_id, sum(value)
      FROM votes WHERE voteable_type = 'Cat'
      GROUP BY voteable_id ORDER BY sum(value) DESC LIMIT 3")

    top_cats_calc.each do |row|
      @top_cats.merge!(Cat.find(row["voteable_id"].to_i) => row["sum"].to_i)
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user

    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def show
    @cat = Cat.includes(:user, :reviews).find(params[:id])
    @cat_image = @cat.user.profile_photo.thumb
    @review = Review.new
    @vote = @cat.votes.find_or_initialize_by(user: current_user)
  end

  def edit
    @cat = Cat.authorized_find(current_user, params[:id])
  end

  def update
    @cat = Cat.authorized_find(current_user, params[:id])

    if @cat.update(cat_params)
      flash[:notice] = "Cat Updated"
      redirect_to cat_path
    else
      render :edit
    end
  end

  def destroy
    @cat = Cat.authorized_find(current_user, params[:id])

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
    params.require(:cat).permit(:name, :description, :url, :tag_string, :cat_photo)
  end
end
