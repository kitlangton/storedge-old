require 'rails_helper'

feature "Admin can search for products" do
  scenario "admin searches for a product from the companies index", js: true do
    admin = create(:admin)
    first_product = create(:product)
    second_product = create(:product)

    login(admin)
    visit root_path

    fill_in "product-search-field", with: first_product.name
    find("#product-search-field").native.send_key(:Enter)

    expect(page).to have_content first_product.name
    expect(page).to_not have_content second_product.name
  end
end
