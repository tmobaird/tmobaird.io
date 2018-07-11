require 'rails_helper'
RSpec.describe "posts/index", type: :view do
  it "renders a list of posts" do
    data_set_one = FakeButterPost.attributes(title: 'Title', body: 'Post body one')
    data_set_two = FakeButterPost.attributes(title: 'Title', body: 'Post body two')
    posts = FactoryGirl.build(:butter_posts, raw_posts: [data_set_one, data_set_two])
    assign(:posts, posts)

    render

    assert_select ".post>h2.post-title", :text => "Title".to_s, :count => 2
    assert_select ".post>.post-body", :text => 'Post body one', :count => 1
    assert_select ".post>.post-body", :text => 'Post body two', :count => 1
  end
end
