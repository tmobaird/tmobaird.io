# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, :github_url, :app_url, uniqueness: true
end
