require 'rails_helper'

feature "User can search for products" do
  scenario "user searches for a product", js: true do
    user = create(:user)
    company = user.company
    folder = create(:folder, company: company)
    product = create(:product, folder: folder, company: company)

    login(user)
    visit root_path

    fill_in "product-search-field", with: product.name
    find("#product-search-field").native.send_key(:Enter)

    expect(page).to have_content product.name
  end

  scenario "user can't search for another company's product", js: true do
    user_company = create(:company)
    other_company = create(:company)
    user = create(:user, company: user_company)
    product = create(:product, company: other_company)

    login(user)
    visit root_path

    fill_in "product-search-field", with: product.name
    find("#product-search-field").native.send_key(:Enter)

    expect(page).to have_content "No products found matching"
  end
end
