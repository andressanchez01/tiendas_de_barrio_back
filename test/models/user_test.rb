# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :text
#  phone                  :decimal(, )
#  address                :string
#  fiscal_number          :decimal(, )
#  role                   :string           default("user")
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
end
