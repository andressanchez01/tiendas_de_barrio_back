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
#  category_id :integer
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

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  accepts_nested_attributes_for :categories

  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

  has_many :votes, as: :votable

  scope :visible, -> {where(visible:true)}
  def category_default
    return self.categories.first.name if self.categories.any?
    "Sin categoria"
  end

  def self.populars
    joins("LEFT JOIN votes ON votes.votable_id = products.id AND votes.votable_type = 'Product'")
      .select("products.*, COUNT(votes.id) AS total")
      .group("products.id")
      .order("total DESC")
  end

end
