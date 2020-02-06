class HashtagsController < ApplicationController
  def show
    @hashtag = hashtag
    @results = Search.in_shouts_for hashtag
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
