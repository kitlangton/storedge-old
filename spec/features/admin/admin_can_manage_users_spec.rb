require 'rails_helper'

feature "Admin can manage all users" do

  let(:admin) { create(:admin) }
  let(:company) { create(:company) }
  let!(:user) { create(:user, company: company) }

  before do
    login(admin)
    click_link "Admin"
    click_link "Users"
  end

  scenario "viewing users", js: true do
    expect(page).to have_content user.email
  end

  scenario "creating users", js: true do
    click_button "new-user-button"

    sleep(1)
    fill_in "Email", with: "anewuser@coloredge.com"
    fill_in "First name", with: "Newman"
    fill_in "Last name", with: "Userton"
    find("#user_last_name").native.send_keys(:Tab, company.name, :Enter)
    click_button "Create user"

    expect(page).to have_content "anewuser@coloredge.com"
    expect(page).to have_content "Newman Userton"
    expect(page).to have_content company.name
  end

  scenario "deleting users", js: true do
    sleep(1)
    click_link "Delete"
    expect(page).not_to have_content user.email
  end

  scenario "editing users", js: true do
    sleep(1)
    first(:link, "Edit").click
    fill_in "Email", with: "chub.dobs@coloredge.com"
    fill_in "First name", with: "Chubby"
    fill_in "Last name", with: "Dobby"
    click_button "Update user"

    expect(page).to have_content "chub.dobs@coloredge.com"
    expect(page).to have_content "Chubby Dobby"
    expect(page).to have_content company.name

  end

end
