# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  customer_name :string
#  address       :string
#  total_amount  :decimal(, )
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  phone         :decimal(, )
#  cart_id       :bigint           not null
#  status        :string
#
class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :products
  has_many :order_items, dependent: :destroy

  def calculate_total
    self.total_amount = order_items.sum(&:total)
  end

  enum status: { pending: 'pending', in_progress: 'in progress', completed: 'completed', canceled:'canceled' }
end
