require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe 'Super Admin' do
    let!(:super_user) { FactoryBot.create(:user, :SuperAdmin) }

    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_user)
    end

    context 'Can perform all CRUD operations' do
      context 'GET Index' do
        it 'can view all customers' do
          get customers_path
          expect(response).to be_successful
          expect(response.code).to eql '200'
        end
      end

      context 'Post Create' do
        it 'Can create Customer' do
          post customers_path, params: { customer: { customer_id: '12345', name: 'test-2', email: 'test@xyz.com', group: 'test-group' } }
          expect(response.code).to eql '302'
        end
      end

      context 'PAtch Update' do
        context 'can update any' do
          let!(:customer_user) { FactoryBot.create(:customer) }

          it 'customer details' do
            patch "/customers/#{customer_user.id}", params: { customer: { group: 'test-group1' } }

            expect(response.code).to eql '302'
            customer_user.reload
            expect(customer_user.group).to eql 'test-group1'
          end
        end
      end

      context 'Delete Destroy' do
        context 'can destroy any' do
          let!(:customer_user) { FactoryBot.create(:customer) }

          it 'customer details' do
            delete "/customers/#{customer_user.id}"
            expect(response.code).to eql '302'
          end
        end
      end
    end
  end

  describe 'Customer Support User' do
    let!(:customer_user) { FactoryBot.create(:user) }
    let!(:customer) { FactoryBot.create(:customer) }

    context 'GET Index' do
      it 'can only view customer data' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(customer_user)

        get customers_path
        expect(response).to be_successful
        expect(response.code).to eql '200'
      end
    end
  end

  describe 'Admin' do
    let!(:admin_user) { FactoryBot.create(:user, :Admin) }
    let!(:customer) { FactoryBot.create(:customer) }

    it 'cannot destroy customer' do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      delete "/customers/#{customer.id}"
      expect(response.code).to eql '204'
    end
  end

  describe 'Designers' do
    let!(:designer_user) { FactoryBot.create(:user, :Designers) }

    context 'Post Create' do
      it 'Can create Customer' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(designer_user)

        post customers_path, params: { customer: { customer_id: '12345', name: 'test-2', email: 'test@xyz.com', group: 'test-group' } }
        expect(response.code).to eql '302'
      end
    end
  end
end
