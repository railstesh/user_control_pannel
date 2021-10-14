FactoryBot.define do
  factory :category do
    SecondaryCategory { "MyString" }
    LeafCategory { "MyString" }
  end
end
