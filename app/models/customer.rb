class Customer < ApplicationRecord
  has_one :address
  has_many :orders

  validates :name, presence: true
  validates :email, uniqueness: true
end
