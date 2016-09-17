require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:admin) { FactoryGirl.create :admin }
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :admin => admin
      ),
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :admin => admin
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select ".post>.card-block>.card-text>h2", :text => "Title".to_s, :count => 2
    assert_select ".post>.card-block>.card-text>.trix-content", :text => "MyText".to_s, :count => 2
  end
end