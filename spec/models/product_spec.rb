require 'rails_helper'

RSpec.describe Product, :type => :model do
  describe "products are tagged with companies" do
    it "products" do
      product = create(:product)
      company = create(:company)
      product.update(company: company)
      expect(product.company).to eq company
    end
  end
end
