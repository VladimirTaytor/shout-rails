# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def current_user
    super || Guest.new
  end
end
