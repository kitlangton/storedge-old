require 'rails_helper'

feature "Admins can categorize products into folders" do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let!(:product) { create(:product) }
  let!(:folder) { create(:folder) }
  let!(:company) { create(:company) }

  describe "when logged in as user" do
    it "user sees folders and subfolders" do
      product.update(folder:folder)
      product.save
      subfolder = folder.children.create(name:"Happy Hut",company:folder.company)
      login(user)
      expect(page).to have_content folder.name
      click_link folder.name
      expect(page).to have_content subfolder.name
    end
  end

  describe "when logged in as an admin", js: true do
    it "creates folders" do
      login(admin)

      click_link "Admin"
      click_link "Companies"
      click_link company.name

      click_button "new-folder-button"
      fill_in "Name", with: "Local Products"
      click_button "Create folder"

      expect(page).to have_content company.name
      expect(page).to have_content "Local Products"
    end
  end
end
