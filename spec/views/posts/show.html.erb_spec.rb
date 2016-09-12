require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:admin) { FactoryGirl.create :admin }
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :body => "MyText",
      :admin => admin
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
