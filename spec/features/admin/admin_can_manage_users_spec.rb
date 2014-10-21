require 'rails_helper'

feature "Admin can manage all users" do

  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  before do
    login(admin)
    click_link "Admin"
    click_link "Users"
  end

  scenario "viewing users", js: true do
    expect(page).to have_css ".user", user.email
  end

  scenario "deleting users", js: true do
    click_link "delete"
    expect(page).not_to have_css ".user", user.email
  end

end
