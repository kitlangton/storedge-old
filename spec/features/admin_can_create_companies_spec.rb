require 'rails_helper'

feature "User adds new company" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  scenario "as admin", js: true do
    login(admin)
    click_link "Admin"
    click_link "Companies"
    click_button "new-company-button"

    fill_in "Name", with: "CocaCola"
    click_button "Create company"

    expect(page).to have_css ".company", text: "CocaCola"
  end

  scenario "as regular user" do
    login(user)

    expect(page).not_to have_link "Admin"
  end
end
