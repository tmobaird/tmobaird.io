require 'rails_helper'
require 'kaminari'
RSpec.describe "posts/index", type: :view do
  let(:admin) { FactoryGirl.create :admin }
  before(:each) do
    assign(:posts, Kaminari.paginate_array([
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
    ]).page(1))
  end

  it "renders a list of posts" do
    render
    assert_select ".post>.card-block>.card-text>h2", :text => "Title".to_s, :count => 2
    assert_select ".post>.card-block>.card-text>.post-body", :text => "MyText".to_s, :count => 2
  end
end
