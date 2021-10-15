require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'enum' do
      it do
        should define_enum_for(:role)
          .with_values(
            CustomerSupport: 0,
            SuperAdmin: 1,
            Admin: 2,
            Designers: 3
          )
      end
    end

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
