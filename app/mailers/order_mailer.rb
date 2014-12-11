class OrderMailer < ActionMailer::Base
  default from: "kit.langton@coloredge.com"

  def new_order_email(user, order)
    @user = user
    @order = order
    @company = user.company
    @csrs = User.where(company: @company, csr:true)
    @csrs.each do |csr|
      mail(to: csr.email, subject: "New Order Placed for #{@company.name}")
    end
  end
end
