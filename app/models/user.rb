class User < ApplicationRecord
  before_validation :set_default_role, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders

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
