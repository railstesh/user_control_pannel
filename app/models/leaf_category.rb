class LeafCategory < ApplicationRecord
  belongs_to :product, optional: true
end
