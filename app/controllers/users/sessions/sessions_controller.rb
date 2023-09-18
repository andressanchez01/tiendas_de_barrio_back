# frozen_string_literal: true

class Users::Sessions::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  private

  def after_sign_in_path_for(resource)
    # Define la ruta a la que deseas redirigir a los usuarios después del inicio de sesión.
    # Por ejemplo, redirige a la página de perfil del usuario:
    root_path
  end


end
