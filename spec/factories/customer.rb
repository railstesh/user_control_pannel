FactoryBot.define do
  factory :customer do
    customer_id { '134245' }
    name { 'test_user' }
    email { 'test@abc.com' }
    group { 'test-group' }
  end
end
