require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_one(:category) }
    it { should have_one(:secondary_category) }
    it { should have_one(:leaf_category) }
    it { should have_one(:revenue) }
    it { should have_many(:orders) }
  end
end
