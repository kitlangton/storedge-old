require 'rails_helper'

feature "User adds new company" do
  let(:admin) { create(:admin) }
  scenario "as admin" do
    login(admin)
    click_link "Admin"
    click_link "Companies"
    click_link "Create new company"

    fill_in "Name", with: "CocaCola"
    click_button "Save company"

    expect(page).to have_css ".company", text: "CocaCola"
  end
end
