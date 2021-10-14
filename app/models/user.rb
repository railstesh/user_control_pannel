class User < ApplicationRecord
  enum role: {
    CustomerSupport: 0,
    SuperAdmin: 1,
    Admin: 2,
    Designers: 3
  }
end
