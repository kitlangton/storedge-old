require 'rails_helper'

feature 'CSR manages orders' do

  let!(:company) { create(:company) }
  let!(:user) { create(:user, company: company) }
  let!(:product) { create(:product, company: company) }
  let!(:csr) { create(:csr, company: company) }
  let!(:order) { create(:order, user: user, company: company) }

  scenario 'the CSR can view orders', js: true do
    login(csr)
    visit root_path
    click_link "Manage Orders"

    expect(page).to have_content order.id
  end

  scenario "the CSR can change the status of an order", js:true do
    login(csr)
    visit root_path
    click_link "Manage Orders"

    click_link "##{order.id}"
    select "Shipped", from: "order_status"
    click_button "Update Status"
    expect(page).to have_content "status has been changed successfully"
  end
end
