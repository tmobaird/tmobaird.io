require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST /posts/markdown' do
    let(:admin) { FactoryGirl.create :admin }

    before { sign_in admin }

    it 'renders markdown and returns html' do
      post '/posts/markdown',
           params: { content: '**test**' },
           headers: { 'ACCEPT' => 'application/json' },
           xhr: true,
           as: :json
      result = JSON.parse(response.body)
      expect(response.content_type).to eq('application/json')
      expect(result).to include('parsed_html' => "<p><strong>test</strong></p>\n")
    end
  end
end
