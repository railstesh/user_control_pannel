class Product < ApplicationRecord
  has_one :category
  has_one :secondary_category
  has_one :leaf_category
  has_one :revenue
  has_many :orders
end
