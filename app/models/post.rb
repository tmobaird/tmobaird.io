class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :admin
  validates :title, presence: true
  paginates_per 5

  def tags=(val)
    write_attribute(:tags, val.gsub(' ', ''))
  end

  def published?
    published
  end

  def self.parse_markdown(text)
    renderer = Redcarpet::Render::HTML.new(markdown_options)
    markdown ||= Redcarpet::Markdown.new(renderer, markdown_extensions)
    markdown.render(text).html_safe
  end

  def self.published_posts
    self.where(published: true)
  end

  def self.unpublished_posts
    self.where(published: false)
  end

  private

  def self.markdown_options
    {
      filter_html: false,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      prettify: true
    }
  end

  def self.markdown_extensions
    {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
      highlight: true
    }
  end
end
