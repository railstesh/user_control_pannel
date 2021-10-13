FactoryBot.define do
  factory :user do
    name { 'test_user' }
    google_id { '103476710972200773544' }
  end

  trait :Super_Admin do
    role { 'Super Admin' }
  end

  trait :Admin do
    role { 'Admin' }
  end

  trait :Customer_support do
    role { 'Customer support' }
  end

  trait :Designers do
    role { 'Designers' }
  end
end
