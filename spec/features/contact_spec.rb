RSpec.feature "Contact" do
  it "has heading contact me" do
    visit contact_path
    expect(page).to have_selector(".display-1", text: "Contact Me!")
  end
end