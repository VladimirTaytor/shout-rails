class AddForgeinKeyToShouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :shouts, :text_shouts, column: :content_id
  end
end
