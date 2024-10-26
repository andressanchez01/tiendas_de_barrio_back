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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
