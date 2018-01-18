# frozen_string_literal: true

RSpec.describe 'Home Page' do
  describe 'User visits home page' do
    it 'displays Welcome' do
      visit root_path
      expect(page).to have_selector 'h1.large-header', text: 'Welcome!'
    end
  end
end
