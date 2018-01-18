# frozen_string_literal: true

class AddFieldsToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :first_name, :string
    add_column :projects, :last_name, :string
  end
end
