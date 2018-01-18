class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :admin

  extend FriendlyId
  friendly_id :title, use: :slugged

  paginates_per 5

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def published?
    published
  end
end
