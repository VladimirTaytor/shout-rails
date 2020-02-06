class SearchesController < ApplicationController
  def show
    @hashtag = text
    @results = Search.in_shouts_for text
  end

  private

  def text
    params[:search][:term]
  end
end
