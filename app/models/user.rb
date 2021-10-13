class User < ApplicationRecord
  enum role: {
    'Customer support': 0,
    'Super Admin': 1,
    Admin: 2,
    Designers: 3
  }
end
