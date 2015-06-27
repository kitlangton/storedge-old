require 'rails_helper'

feature "Users only sees their company's products" do

  let(:company) { create(:company) }
  let(:other_company) { create(:company, name: "Other Co.") }
  let(:user) { create(:user, company: company) }
  let!(:product) { create(:product, company: company) }

  before(:each) do
    login(user)
  end

  describe "A user logs in as under the company" do
    it "sees CocaCola's products" do
      visit root_path
      expect(page).to have_content product.name
    end

    it "doesn't see other companies products" do
      product.update(company: other_company)
      visit root_path

      expect(page).not_to have_content product.name
    end

    it "can't go to other companies' pages" do
      visit company_path other_company
      expect(page).not_to have_content "Other Co."
    end
  end
end
