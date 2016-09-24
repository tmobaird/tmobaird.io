require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "markdown" do
    it "returns <b>test</b>" do
      expect(helper.markdown("**test**")).to include("<strong>test</strong>")
    end
  end
end
