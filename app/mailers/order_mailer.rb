class OrderMailer < ActionMailer::Base
  default from: "kit.langton@coloredge.com"

  def new_order_email(recipient, order)
    @order = order
    @user = @order.user
    @company = @user.company
    mail(to: recipient.email, subject: "New Order Placed for #{@company.name}")
  end

  def order_status_email(order)
    @user = order.user
    @order = order
    @company = @user.company
    mail(to: @user.email, subject: "Status Changed to #{@order.status} for Order ##{@order.id}")
  end
end
