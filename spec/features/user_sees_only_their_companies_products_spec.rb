require 'rails_helper'

feature 'Users only sees a companies products' do

  let(:user) { create(:user) }
  let(:product) { create(:product) }

  before(:each) do
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  describe "A user logs in as under the company" do
    it "sees CocaCola's products" do
      user.company_list.add("CocaCola")
      user.save
      product.company_list.add("CocaCola")
      product.save

      visit root_path
      expect(page).to have_css(".product", text:product.name)
    end

    it "doesn't see other companies products" do
      user.company_list.add("CocaCola")
      product.company_list.add("Exxon")
      puts user.company_list.first

      visit root_path
      expect(page).not_to have_css(".product", text:product.name)
    end
  end
end
