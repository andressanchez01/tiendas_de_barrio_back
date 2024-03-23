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
