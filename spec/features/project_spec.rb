RSpec.feature "Projects" do
  let(:admin) { FactoryGirl.create :admin }

  describe "View Projects" do
    it "displays cards of projects" do
      project_one = FactoryGirl.create(:project, title: "New Project 1")
      project_two = FactoryGirl.create(:project, title: "New Project 2")
      visit projects_path
      expect(page).to have_selector(".card-title", text: "New Project 1")
      expect(page).to have_selector(".card-title", text: "New Project 2")
    end
  end
  context "Auth Required" do
    before { sign_in admin }
    describe "View Project" do
      it "displays project card" do
        project_one = FactoryGirl.create(:project, title: "New Project 1")
        visit project_path(project_one)
        expect(page).to have_selector(".card-title", text: "New Project 1")
        expect(page).to have_link("Show")
        expect(page).to have_link("Edit")
        expect(page).to have_link("Destroy")
      end
    end
    describe "Create Project" do
      it "creates and displays a new project" do
        visit new_project_path
        fill_in "project[title]", with: "My New Project"
        fill_in "project[description]", with: "My New Project's Description"
        fill_in "project[github_url]", with: "github.com/my_new_project"
        fill_in "project[app_url]", with: "google.com/my_new_project"
        click_button "Create Project"
        expect(page).to have_selector(".alert", text: "Project was successfully created.")
        expect(page).to have_selector(".card-title", text: "My New Project")
        expect(page).to have_selector(".card-text", text: "My New Project's Description")
      end
    end
    describe "Edit Project" do
      it "updates and displays a project" do
        project_one = FactoryGirl.create :project
        visit edit_project_path(project_one)
        fill_in "project[title]", with: "My Updated Project"
        click_button "Update Project"
        expect(page).to have_selector(".alert", text: "Project was successfully updated.")
        expect(page).to have_selector(".card-title", text: "My Updated Project")
        expect(page).to have_selector(".card-text", text: project_one.description)
      end
    end
    describe "Destroy Project", js: true do
      it "destroys a project" do
        project_one = FactoryGirl.create :project
        visit projects_path
        accept_alert do
          click_link('Destroy')
        end
        expect(page).to have_selector(".alert", text: "Project was successfully destroyed.")
        expect(page).to_not have_selector(".card-title", text: project_one.title)
      end
    end
  end
end