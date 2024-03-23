class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_one :order
  def add_product(product)
    cart_item = cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.increment(:quantity)
    cart_item.save
  end


end
