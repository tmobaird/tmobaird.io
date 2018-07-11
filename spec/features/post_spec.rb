RSpec.feature "Posts" do
  describe "View Posts" do
    it "displays posts" do
      data = FakeButterPost.attributes(title: 'Test Post', body: 'This is a test post')
      allow(ButterCMS::Post).to receive(:all).and_return(FactoryGirl.build(:butter_posts, raw_posts: [data]))

      visit posts_path
      expect(page).to have_selector(".post", text: "Test Post")
    end
  end
  describe "View Post" do
    it "displays post" do
      data = FakeButterPost.attributes(title: 'Test Post', body: 'This is a test post body', author: {
        "first_name" => "First",
        "last_name" => "Last",
        "email" => "test@testing.com"
      })
      post = FactoryGirl.build(:butter_post, data: data)
      allow(ButterCMS::Post).to receive(:find).with(post.slug).and_return(post)

      visit post_path(post.slug)

      expect(page).to have_selector("h1", text: "Test Post")
      expect(page).to have_selector(".post-body-full", text: "This is a test post body")
      expect(page).to have_selector("small", text: "by First Last")
      expect(page).to have_link("Back")
    end
  end
end
