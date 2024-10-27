# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  stock       :integer
#  price       :decimal(, )
#  rank        :integer
#  idCategory  :integer
#  idProduct   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cost        :decimal(, )
#  image       :string
#  visible     :boolean          default(TRUE)
#  slug        :string
#
class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name,:description,:stock,:cost,:price, presence: true

  has_one_attached :image
  has_many :cart_items

  has_many :product_categories
  has_many :categories, through: :product_categories

  accepts_nested_attributes_for :categories

  def category_default
    return self.categories.first.name if self.categories.any?
    "Sin categoria"
  end
end
