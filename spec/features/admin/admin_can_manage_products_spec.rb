require 'rails_helper'

feature "Admin can manage all products" do

  let(:admin) { create(:admin) }
  let!(:company) { create(:company) }
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }

  before do
    login(admin)
    click_link "Admin"
    click_link "Products"
  end

  scenario "viewing products", js: true do
    expect(page).to have_content product.name
    expect(page).to have_content product.price
  end

  scenario "creating products", js: true do
    click_button "new-product-button"

    fill_in "Name", with: "Wonderous Product"
    fill_in "Price", with: "55.55"
    click_button "Create product"

    expect(page).to have_content "Wonderous Product"
    expect(page).to have_content "$55.55"
    expect(page).to have_content company.name
  end

  scenario "deleting products", js: true do
    click_link "Delete"
    accept_dialog
    expect(page).not_to have_content product.name
  end

  scenario "editing products", js: true do
    click_link "Edit"
    fill_in "First name", with: "Chubby"
    fill_in "Last name", with: "Dobby"
    click_button "Update product"

    expect(page).to have_content "Chubby Dobby"
  end

end
