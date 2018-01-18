# frozen_string_literal: true

class AddPublishedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :published, :boolean, null: false, default: true
  end
end
