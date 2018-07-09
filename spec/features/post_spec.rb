RSpec.feature "Posts" do
  describe "View Posts" do
    xit "displays posts" do
      post_one = FactoryGirl.create(:post, title: "New Post 1", admin: admin)
      visit posts_path
      expect(page).to have_selector(".post", text: "New Post 1")
    end
  end
  describe "View Post" do
    xit "displays post" do
      post_one = FactoryGirl.create(:post, title: "New Post 1", body: "Test Post Body")
      visit post_path(post_one)
      expect(page).to have_selector("h1", text: "New Post 1")
      expect(page).to have_selector(".post-body-full", text: "Test Post Body")
      expect(page).to have_selector("small", text: "by #{post_one.admin.full_name}")
      expect(page).to have_link("Back")
    end
  end
end