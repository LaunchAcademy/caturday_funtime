class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_path
    else
      render :new
    end
  end


  private
    def cat_params
      params.require(:cat).permit(:name, :description, :url)
    end

end
