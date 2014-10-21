require 'rails_helper'

feature "Admin manages companies" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  before do
    login(admin)
    click_link "Admin"
    click_link "Companies"
  end

  scenario "creating companies", js: true do
    click_button "new-company-button"

    fill_in "Name", with: "CocaCola"
    click_button "Create company"

    expect(page).to have_css ".company", text: "CocaCola"
  end

  scenario "deleting companies", js: true do
    click_button "delete-company-button"

    expect(page).not_to have_css ".company", text: "CocaCola"
  end
end
