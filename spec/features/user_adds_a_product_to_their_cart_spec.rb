require 'rails_helper'

feature "User adds a product to their cart" do
  let(:company) { create(:company) }
  let(:user) { create(:user, company: company) }
  let(:folder) { create(:folder, company: company) }
  let!(:product) { create(:product, company: company, folder: folder) }

  scenario "They see it in their cart", js: true do
    login(user)
    visit root_path
    find(".folder-btn").trigger('click')

    click_button "Add To Cart"
    fill_in "quantity", with: "5"
    click_button "Submit"
    click_link "Cart"

    expect(page).to have_content product.name
  end
end
