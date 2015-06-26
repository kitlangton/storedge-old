require 'rails_helper'

feature "Admin can manage all products" do

  let(:admin) { create(:admin) }
  let!(:company) { create(:company) }
  let!(:user) { create(:user, company: company) }
  let!(:product) { create(:product, company: company) }

  before (:each) do
    login(admin)
    click_link "Admin"
    click_link "Products"
  end

  scenario "viewing products", js: true do
    expect(page).to have_content product.name
    expect(page).to have_content product.price
  end

  scenario "creating products", js: true do
    click_link "Home"
    click_link company.name
    click_link "new-product-button"

    fill_in "Name", with: "Wonderous Product"
    fill_in "Price", with: "55.55"
    click_button "Create product"

    expect(page).to have_content "Wonderous Product"
    expect(page).to have_content "$55.55"
    expect(page).to have_content company.name
  end

  scenario "deleting products", js: true do
    click_link "Delete"
    expect(page).not_to have_content product.name
  end

  scenario "editing products", js: true do
    click_link "Edit"
    fill_in "Name", with: "Chubby Dobby"
    fill_in "Price", with: "55.60"
    click_button "Update product"

    expect(page).to have_content "Chubby Dobby"
    expect(page).to have_content "$55.60"
  end

end
