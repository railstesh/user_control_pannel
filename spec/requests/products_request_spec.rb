require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe 'Super Admin' do
    let!(:super_user) { FactoryBot.create(:user, :SuperAdmin) }

    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_user)
    end

    context 'Can perform all CRUD operations' do
      context 'GET Index' do
        it 'can view all products' do
          get products_path
          expect(response).to be_successful
          expect(response.code).to eql '200'
        end
      end

      context 'Post Create' do
        it 'Can create product' do
          post products_path, params: { product: { product_id: '12345', name: 'test-product', sku: 'test123', size: '3.4', weight: '4,5' } }
          expect(response.code).to eql '302'
        end
      end
      context 'PAtch Update' do
        context 'can update any' do
          let!(:product) { FactoryBot.create(:product) }

          it 'product details' do
            patch "/products/#{product.id}", params: { product: { size: '7.0' } }

            expect(response.code).to eql '302'
            product.reload
            expect(product.size).to eql '7.0'
          end
        end
      end

      context 'Delete Destroy' do
        context 'can destroy any' do
          let!(:product) { FactoryBot.create(:product) }

          it 'product details' do
            delete "/products/#{product.id}"
            expect(response.code).to eql '302'
          end
        end
      end
    end
  end

  describe 'Customer Support User' do
    let!(:customer_user) { FactoryBot.create(:user) }
    let!(:product) { FactoryBot.create(:product) }

    context 'GET Index' do
      it 'can only view customer data' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(customer_user)

        get products_path
        expect(response).to be_successful
        expect(response.code).to eql '200'
      end
    end
  end

  describe 'Admin' do
    let!(:admin_user) { FactoryBot.create(:user, :Admin) }
    let!(:product) { FactoryBot.create(:product) }

    it 'cannot destroy product' do
      allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      delete "/products/#{product.id}"
      expect(response.code).to eql '204'
    end
  end

  describe 'Designers' do
    let!(:designer_user) { FactoryBot.create(:user, :Designers) }

    context 'Post Create' do
      it 'Can create product' do
        allow_any_instance_of(ApplicationController).to receive(:user_signed_in?).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(designer_user)

        post products_path, params: { product: { product_id: '12345', name: 'test-product', sku: 'test123', size: '3.4', weight: '4,5' } }
        expect(response.code).to eql '302'
      end
    end
  end
end
