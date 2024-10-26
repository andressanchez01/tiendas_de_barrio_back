# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart, optional:true
  belongs_to :product
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  def subtotal
    product.price * quantity
  end
  def calculate_total
    cart_items.sum { |item| item.quantity * item.product.price }
  end
end
