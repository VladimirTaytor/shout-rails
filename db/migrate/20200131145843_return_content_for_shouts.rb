# frozen_string_literal: true

class ReturnContentForShouts < ActiveRecord::Migration[6.0]
  class Shout < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextShout < ApplicationRecord; end
  def change
    reversible do |dir|
      Shout.reset_column_information
      Shout.find_each do |shout|
        dir.up do
          text_shout = TextShout.find(id: shout.content_id).first
          shout.update(content_id: text_shout.id, content_type: 'TextShout')
        end
        dir.down do
          shout.update(body: shout.content.body)
          shout.content.destroy
        end
      end
    end
  end
end
