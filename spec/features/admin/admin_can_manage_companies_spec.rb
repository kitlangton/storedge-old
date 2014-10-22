require 'rails_helper'

feature "Admin manages companies" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:company) { create(:company) }

  before do
    login(admin)
    click_link "Admin"
    click_link "Companies"
  end

  scenario "creating companies", js: true do
    click_button "new-company-button"

    fill_in "Name", with: "CocaCola"
    click_button "Create company"

    expect(page).to have_content "CocaCola"
  end

  scenario "deleting companies", js: true do
    click_link "Delete"
    accept_dialog
    wait_for_ajax
    expect(page).not_to have_content company.name
  end
end
