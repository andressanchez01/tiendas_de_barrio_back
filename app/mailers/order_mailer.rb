class OrderMailer < ApplicationMailer
  def confirmation_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your order confirmation')
  end
end
