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

  def order_status_email(order)
    @user = order.user
    @order = order
    @company = @user.company
    mail(to: @user.email, subject: "Status Changed to #{@order.status} for Order ##{@order.id}")
  end
end
