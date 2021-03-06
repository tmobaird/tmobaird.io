require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:admin) { FactoryGirl.create :admin }
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :body => "MyText",
      :admin => admin
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post-body-form[name=?]", "post[body]"
    end
  end
end
