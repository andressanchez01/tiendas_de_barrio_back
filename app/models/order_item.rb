class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def calculate_total
    self.total = quantity * price
  end
end
