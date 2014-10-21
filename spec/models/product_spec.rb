require 'rails_helper'

RSpec.describe Product, :type => :model do
  describe "products are tagged with companies" do
    it "products" do
      product = create(:product)
      product.company_list.add("CocaCola")
      puts product.company_list
    end
  end
end
