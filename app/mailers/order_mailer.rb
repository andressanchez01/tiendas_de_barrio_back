class OrderMailer < ApplicationMailer
  def confirmation_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'Orden Confirmada')
  end
end
