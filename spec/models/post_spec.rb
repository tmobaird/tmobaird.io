require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#parse_markdown" do
    it "returns <b>test</b>" do
      expect(Post.parse_markdown("**test**")).to include("<strong>test</strong>")
    end
  end
  describe "#published?" do
    it "returns true" do
      post = FactoryGirl.create :post
      expect(post.published?).to be true
    end
    it "returns false" do
      post = FactoryGirl.create :post, published: false
      expect(post.published?).to be false
    end
  end
end
