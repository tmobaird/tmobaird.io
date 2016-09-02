class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :github_url, uniqueness: true
  validates :app_url, uniqueness: true

end
