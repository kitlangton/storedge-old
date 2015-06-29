require 'rails_helper'

feature "Admin can manange all orders" do
  scenario "admin clicks the Manage Orders link", js: true do
    admin = create(:admin)
    company = create(:company)
    order = create(:order, company: company)

    login(admin)
    visit root_path
    click_link "Manage Orders"

    expect(page).to have_content "##{order.id}"
  end
end
