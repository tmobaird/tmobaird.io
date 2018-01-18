# frozen_string_literal: true

require 'rails_helper'

describe 'Markdown Renderer' do
  describe 'parse_markdown' do
    it 'returns <b>test</b>' do
      expect(MarkdownRenderer.parse_markdown('**test**')).to include('<strong>test</strong>')
    end
  end
end
