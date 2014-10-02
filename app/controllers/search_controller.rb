class SearchController < ApplicationController
  CATS_PER_PAGE = 9

  def index
    @search = Cat.search_name(params[:name]).page(params[:page]).per(CATS_PER_PAGE)

    if @search.empty?
      @search = Cat.search_description(params[:name]).page(params[:page])
                   .per(CATS_PER_PAGE)
    end
  end
end
