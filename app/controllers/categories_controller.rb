class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @cats = @category.cats
  end

  def index
    @categories = Category.all
  end
end
