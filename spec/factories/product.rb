FactoryBot.define do
  factory :product do
    product_id { '165245' }
    name { 'test_product' }
    sku { 'pro123' }
    weight { '3.0' }
    size { '2.0' }
  end
end
