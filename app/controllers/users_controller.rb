class UsersController < ApplicationController
  before_action :require_admin ,:set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      SendConfirmationEmailJob.perform_later(@user)
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Acción para editar un usuario
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :encrypted_password, :phone, :address, :fiscal_number, :role)
  end

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end
end