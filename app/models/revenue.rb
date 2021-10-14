class Revenue < ApplicationRecord
  belongs_to :product, optional: true
end
