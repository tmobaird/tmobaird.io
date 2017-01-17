class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :admin
  validates :title, presence: true
  paginates_per 5
end
