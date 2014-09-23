class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    if user_signed_in?
      @cat = Cat.new
    else
      flash[:alert] = "You must be logged in to access this section!"
      redirect_to new_user_session_path
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_path
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description, :url)
  end

end
