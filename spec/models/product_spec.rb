require 'rails_helper'

RSpec.describe Product, :type => :model do
  describe "products are tagged with companies" do
    it "products" do
      company = create(:company)
      product = create(:product, company: company)
      expect(product.company).to eq company
    end
  end
end
