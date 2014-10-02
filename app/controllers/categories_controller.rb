class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @cats = @category.cats
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.authorized_find(current_user, params[:id])

    if @category.destroy
      flash[:notice] = "pestilence stamped out"
    else
      flash[:alert] = "unable to rid site of pestilence"
    end

    redirect_to categories_path
  end
end
