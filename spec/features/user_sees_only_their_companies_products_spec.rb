require 'rails_helper'

feature "Users only sees their company's products" do

  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:company) { create(:company) }

  before(:each) do
    login(user)
  end

  describe "A user logs in as under the company" do
    it "sees CocaCola's products" do
      user.update(company: company)
      product.update(company: company)

      visit root_path
      expect(page).to have_css(".product", text:product.name)
    end

    it "doesn't see other companies products" do
      user.update(company: company)

      visit root_path
      expect(page).not_to have_css(".product", text:product.name)
    end
  end
end
