# frozen_string_literal: true

class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  has_many :likes

  default_scope { order(created_at: :desc) }

  def username
    user.username
  end
end
