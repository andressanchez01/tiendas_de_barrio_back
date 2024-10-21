class Product < ApplicationRecord
  validates :name,:description,:stock,:cost,:price, presence: true

  has_one_attached :image
  has_many :cart_items
end
