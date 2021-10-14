FactoryBot.define do
  factory :user do
    name { 'test_user' }
    google_id { '103476710972200773544' }
  end

  trait :SuperAdmin do
    role { 'SuperAdmin' }
  end

  trait :Admin do
    role { 'Admin' }
  end

  trait :CustomerSupport do
    role { 'CustomerSupport' }
  end

  trait :Designers do
    role { 'Designers' }
  end
end
