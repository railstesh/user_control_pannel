require 'rails_helper'

RSpec.describe User, type: :model do
  describe "enum" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:super_user) { FactoryBot.create(:user, :SuperAdmin) }
    let!(:admin_user) { FactoryBot.create(:user, :Admin) }
    let!(:designer) { FactoryBot.create(:user, :Designers) }

    it { expect(user.role).to eq 'CustomerSupport' }
    it { expect(super_user.role).to eq 'SuperAdmin' }
    it { expect(admin_user.role).to eq 'Admin' }
    it { expect(designer.role).to eq 'Designers' }
  end
end
