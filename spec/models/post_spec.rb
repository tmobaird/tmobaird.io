require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#parse_markdown" do
    it "returns <b>test</b>" do
      expect(Post.parse_markdown("**test**")).to include("<strong>test</strong>")
    end
  end
end
