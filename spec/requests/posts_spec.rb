require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "POST /posts/markdown" do
    let(:admin) { FactoryGirl.create :admin }
    before {
      sign_in admin
    }

    it "renders markdown and returns html" do
      headers = { "ACCEPT" => "application/json" }
      post '/posts/markdown',
        params: { content: "**test**" },
        headers: headers,
        xhr: true,
        as: :json
      result = JSON.parse(response.body)
      expect(response.content_type).to eq("application/json")
      expect(result).to include("parsed_html" => "<p><strong>test</strong></p>\n")
    end
  end
end
