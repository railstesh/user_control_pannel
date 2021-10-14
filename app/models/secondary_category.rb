class SecondaryCategory < ApplicationRecord
  belongs_to :product, optional: true
end
