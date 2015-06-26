require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "has a valid factory" do
    expect(create(:order)).to be_valid
  end

  it "dispalys the total quantity" do
    order = create(:order)
    order.shopping_cart_items << create(:shopping_cart_item, quantity: 2)
    order.shopping_cart_items << create(:shopping_cart_item, quantity: 3)
    expect(order.total_quantity).to eq 5
  end

  it "returns its subtotal" do
    order = create(:order)
    order.shopping_cart_items << create(:shopping_cart_item, quantity: 2, price: 5)
    order.shopping_cart_items << create(:shopping_cart_item, quantity: 1, price: 10)

    expect(order.subtotal).to eq 20
  end

  it "sends an email" do
    csr = create(:csr)
    company = csr.company
    create(:csr, company: company)
    user = create(:user, company: company )
    expect { create(:order, user: user) }.to change { ActionMailer::Base.deliveries.count }.by(2)
  end

  it "starts with a status of new" do
    order = create(:order)
    expect(order.display_status).to eq "New"
  end

  it "has a status of old after five days" do
    order = create(:order)
    travel_to(5.days.from_now) do
      expect(order.display_status).to eq "Old"
    end
  end

end
