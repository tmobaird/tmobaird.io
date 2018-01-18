# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before do
    assign(:projects, [
             FactoryGirl.create(:project),
             FactoryGirl.create(:project)
           ])
  end

  it 'renders a list of projects' do
    render
  end
end
