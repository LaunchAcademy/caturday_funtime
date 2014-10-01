class SearchController < ApplicationController

  def index
    @search = Cat.search_name(params[:name])

    if @search.empty?
      @search = Cat.search_description(params[:name])
    end
  end
end
