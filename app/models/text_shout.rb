# frozen_string_literal: true

class TextShout < ApplicationRecord
  validates :body, presence: true, length: { in: 1..144 }
end
