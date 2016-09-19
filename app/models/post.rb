class Post < ApplicationRecord
  belongs_to :admin
  validates :title, presence: true
  paginates_per 5
end
