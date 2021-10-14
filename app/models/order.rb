class Order < ApplicationRecord
  has_one :billing
  has_one :shipping
  belongs_to :customer
  belongs_to :product

  enum status: {
    artwork_approved: 0,
    artwork_sent: 1,
    canceled: 2,
    checked: 3,
    customer_comments: 4,
    design_hold: 5,
    designer_comment: 6,
    holded: 7,
    in_production: 8,
    in_recreation: 9,
    low_resolution_file: 10,
    marketplace_order: 11,
    outsource: 12,
    packed: 13,
    packed_partial: 14,
    partial_printed_shipped: 15,
    payment_received: 16,
    printed: 17,
    printed_and_shipped: 18,
    processing: 19,
    reprint: 20,
    v_order_confirmation: 21
  }
end
