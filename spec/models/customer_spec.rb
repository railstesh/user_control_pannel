require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    subject { Customer.new(name: 'test', email: 'test@xyz.com') }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:orders) }
    it { should have_one(:address) }
  end
end
