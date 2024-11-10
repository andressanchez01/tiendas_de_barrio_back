class SendConfirmationEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.confirmation_email(user).deliver_now
  end
end
