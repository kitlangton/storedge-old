require 'rails_helper'

feature 'User can view their orders' do

  let(:company) { create(:company) }
  let(:other_company) { create(:company) }
  let(:user) { create(:user, company: company) }
  let(:product) { create(:product, company: company) }
  let(:order) { create(:order, user: user)}
  let(:shopping_cart_item) { create(:shopping_cart_item, order: order)}

  scenario 'user views their orders' do

  end

end
