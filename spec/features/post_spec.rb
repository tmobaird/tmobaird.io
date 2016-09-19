RSpec.feature "Posts" do
  let(:admin) { FactoryGirl.create :admin }

  describe "View Posts" do
    it "displays posts" do
      post_one = FactoryGirl.create(:post, title: "New Post 1", admin: admin)
      post_two = FactoryGirl.create(:post, title: "New Post 2", admin: admin)
      visit posts_path
      expect(page).to have_selector(".post", text: "New Post 1")
      expect(page).to have_selector(".post", text: "New Post 2")
    end
  end
  context "Auth Required" do
    before { sign_in admin }
    describe "View Post" do
      it "displays post" do
        post_one = FactoryGirl.create(:post, title: "New Post 1", body: "Test Post Body")
        visit post_path(post_one)
        expect(page).to have_selector("h1", text: "New Post 1")
        expect(page).to have_selector(".trix-content", text: "Test Post Body")
        expect(page).to have_selector("small", text: "by #{post_one.admin.full_name}")
        expect(page).to have_link("Edit")
        expect(page).to have_link("Back")
      end
    end
    describe "Create Post" do
      it "creates and displays a new post", js: true do
        visit new_post_path
        fill_in "post[title]", with: "My New Post"
        execute_script("document.getElementsByTagName('trix-editor')[0].value = 'My New Posts Body'")
        click_button "Create Post"
        expect(page).to have_selector(".alert", text: "Post was successfully created.")
        expect(page).to have_selector("h1", text: "My New Post")
        expect(page).to have_selector(".trix-content", text: "My New Posts Body")
        expect(page).to have_selector("small", text: "by #{admin.full_name}")
      end
    end
    describe "Edit Post" do
      it "updates and displays a post", js: true do
        post_one = FactoryGirl.create :post
        visit edit_post_path(post_one)
        fill_in "post[title]", with: "My Updated Post"
        click_button "Update Post"
        expect(page).to have_selector(".alert", text: "Post was successfully updated.")
        expect(page).to have_selector("h1", text: "My Updated Post")
        expect(page).to have_selector(".trix-content", text: "#{post_one.body}")
        expect(page).to have_selector("small", text: "by #{admin.full_name}")
      end
    end
    describe "Destroy Post", js: true do
      it "destroys a post" do
        post_one = FactoryGirl.create :post
        visit posts_path
        accept_alert do
          click_link('Destroy')
        end
        expect(page).to have_selector(".alert", text: "Post was successfully destroyed.")
        expect(page).to_not have_selector("tr", text: post_one.title)
      end
    end
  end
end