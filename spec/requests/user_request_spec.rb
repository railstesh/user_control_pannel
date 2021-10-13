require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'Customer Support User' do
    let!(:customer_user) { FactoryBot.create(:user) }

    context 'GET Index' do
      it 'can access' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(customer_user)

        get users_path
        expect(response).to be_successful
        expect(response.code).to eql '200'
      end
    end

    context 'Post Create' do
      it 'cannot access' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(customer_user)

        post users_path, params: { user: { name: 'test', google_id: '12344578' } }
        expect(response.code).to eql '204'
      end
    end
  end

  describe 'Designers' do
    let!(:designer) { FactoryBot.create(:user, :Designers) }

    context 'Post create' do
      it 'can only create' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(designer)

        post users_path, params: { user: { name: 'test-1', google_id: '12344578', role: 'Designers' } }
        expect(response.code).to eql '302'
      end
    end
  end

  describe 'Admin' do
    let!(:admin_user) { FactoryBot.create(:user, :Admin) }

    it 'cannot destroy' do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      delete "/users/#{admin_user.id}"
      expect(response.code).to eql '204'
    end
  end

  describe 'Super Admin' do
    let!(:super_user) { FactoryBot.create(:user, :Super_Admin) }
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_user)
    end

    context 'Can perform all CRUD operations' do
      it 'Can create User' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_user)

        post users_path, params: { user: { name: 'test-2', google_id: '12344578', role: 'Admin' } }
        expect(response.code).to eql '302'
      end

      it 'can view all users' do
        get users_path
        expect(response).to be_successful
        expect(response.code).to eql '200'
      end

      context 'can update any' do
        let!(:customer_user) { FactoryBot.create(:user) }
        it 'user details' do
          patch "/users/#{customer_user.id}", params: { user: { role: 'Admin' } }

          expect(response.code).to eql '302'
          customer_user.reload
          expect(customer_user.role).to eql 'Admin'
        end
      end

      context 'can destroy any' do
        let!(:customer_user) { FactoryBot.create(:user) }

        it 'user details' do
          delete "/users/#{customer_user.id}"
          expect(response.code).to eql '302'
        end
      end
    end
  end
end
