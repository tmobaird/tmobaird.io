RSpec.feature "Home Page" do
  describe "User visits home page" do
    it "should display Welcome" do
      visit root_path
      expect(page).to have_selector "h1.large-header", text: "Welcome!"
    end
  end
end