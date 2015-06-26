require 'rails_helper'

RSpec.describe Product, :type => :model do
  describe "products are tagged with companies" do

    it "has a valid factory" do
      expect(create(:product)).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:product, name: nil)).to_not be_valid
    end

    it "is invalid without a price" do
      expect(build(:product, price: nil)).to_not be_valid
    end

    it "is invalid without a company" do
      product = build(:product, company: nil)
      expect(product).to_not be_valid
    end
  end
end
