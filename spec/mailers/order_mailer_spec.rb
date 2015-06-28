require "rails_helper"

RSpec.describe OrderMailer, :type => :mailer do
  describe "#new_order_email" do
    it "delivers a new order email" do
      recipient = build_stubbed(:csr)
      order = build_stubbed(:order)

      email = OrderMailer.new_order_email(recipient,order)

      expect(email).to deliver_to recipient.email
      expect(email).to have_subject(/#{order.company}/)
    end
  end
end
