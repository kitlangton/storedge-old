require 'rails_helper'

feature "User submits an order spec" do

  let(:company) { create(:company) }
  let(:user) { create(:user, company: company) }
  let!(:product) { create(:product, company: company) }

  before(:each) do
    login(user)
  end

  scenario "A user submits their cart", js: true do
      visit root_path
      sleep(1)
      click_button "Add To Cart"
      fill_in "Quantity", with: "30"
      click_button "Submit"
      click_link "Cart"

      expect(page).to have_content product.name
      expect(page).to have_content "30"
      click_button "Submit Order"
      expect(page).to have_content "Your order has been placed successfully!"
  end
end
