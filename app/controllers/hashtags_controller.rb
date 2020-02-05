class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Search.for_hashtag @hashtag
  end
end
