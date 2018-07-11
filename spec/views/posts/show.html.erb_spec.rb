require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  it "renders attributes in <p>" do
    data = FakeButterPost.attributes(title: 'Title', body: 'Post body', author: {
      "first_name" => "First",
      "last_name" => "Last"
    })
    post = FactoryGirl.build(:butter_post, data: data)
    assign(:post, post)

    render

    assert_select "h1.post-title", text: 'Title', count: 1
    assert_select ".post-body-full", text: 'Post body', count: 1
    assert_select "small>.light-text", /First Last/
  end
end
