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
