# frozen_string_literal: true

class ShoutsController < ApplicationController
  def show
    @shouts = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shouts_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  private

  def shouts_params
    { content: content_from_params}
  end

  def content_from_params
    TextShout.new(content_params)
  end

  def content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: 'Shouted successfully!' }
    else
      { notice: 'Shouting failed' }
    end
  end
end
