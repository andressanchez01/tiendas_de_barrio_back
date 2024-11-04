# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :text
#  phone                  :decimal(, )
#  address                :string
#  fiscal_number          :decimal(, )
#  role                   :string           default("user")
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  before_validation :set_default_role, on: :create

  has_one :cart
  has_many :orders
  has_many :comments, dependent: :destroy


  ROLES = ['user', 'admin']

  validates :role, inclusion: { in: ROLES }
  def admin?
    role == 'admin'
  end
  private
  def set_default_role
    self.role ||= :user if role.nil?
  end
end
