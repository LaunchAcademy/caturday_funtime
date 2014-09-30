class SearchController < ApplicationController

  def index
    @search = Cat.search_name(params[:name])

    if !params[:name].nil? && params[:name].empty?
      @search = Cat.search_description(params[:description])
    end
  end
end
