# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone, :address, :fiscal_number)
  end

end
