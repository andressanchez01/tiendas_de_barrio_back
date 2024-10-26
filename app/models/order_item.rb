# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  product_id :bigint           not null
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :decimal(, )
#  total      :decimal(, )
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def calculate_total
    self.total = quantity * price
  end
end
