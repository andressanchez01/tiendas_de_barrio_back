class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'  # Cambia esto al correo que desees

  def confirmation_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'  # URL para iniciar sesión o confirmar
    mail(to: @user.email, subject: 'Confirmación de tu cuenta en Astronix')
  end
end
