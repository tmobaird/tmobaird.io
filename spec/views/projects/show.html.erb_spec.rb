# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before do
    @project = assign(:project, FactoryGirl.create(:project))
  end

  it 'renders attributes in <p>' do
    render
  end
end
