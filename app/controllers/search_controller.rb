class SearchController < ApplicationController
  before_action :authenticate_user!


  def create

  end

  def index
    @search = nil
  end

  def search_params
    params.require(:search).permit(:name)
  end
end
