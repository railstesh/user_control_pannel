require 'rails_helper'

RSpec.describe Billing, type: :model do
  describe 'associations' do
    it { should belong_to(:order).class_name('Order') }
  end
end
