class Order < ApplicationRecord
  has_one :billing
  has_one :shipping
  belongs_to :customer
  belongs_to :product
end
