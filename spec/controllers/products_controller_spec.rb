require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  describe 'GET #index' do
    context 'when a user navigates to the index page' do
      it 'renders the index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    context 'when a user navigates to the product page' do
      it 'renders the product show template' do
        get :show, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
      end
    end
  end

  describe 'GET #new' do
    before do
      sign_in @admin
    end
    context 'when a new product is added' do
      it 'renders new product template' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    context 'when the user admin is logged in' do
      before do
        sign_in @admin
      end
      it 'renders the product edit template' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to render_template('edit')
      end
    end

    context 'when a regular user is logged in' do
      before do
        sign_in @user
      end
      it 'renders the root path' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when there is no one logged in' do
      before do
        sign_out @user
      end
      it 'renders the root path' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when a valid product is created' do
      before do
        sign_in @admin
      end
      it 'valid product is created' do
        post :create, params: { product: { name: @product.name, description: @product.description, price: @product.price} }
        expect(assigns(:product)).to be_a(Product)
      end

      it "invalid product creation is denied" do
        @invalid_product = FactoryBot.build(:product, name: "")
        post :create, params: {product: { name: @invalid_product.name, description: @invalid_product.description, price: @invalid_product.price} }
        expect(@invalid_product).not_to be_valid
      end
    end
  end

  describe 'PATCH #update' do
    context 'when a product is updated' do
      before do
        sign_in @admin
      end
      it "update name attribute" do
        post :update, params: { id: @product.id, product: { name: "update_name"} }
        @product.reload
        expect(@product.name).to eq "update_name"
      end
    end
  end

  describe 'DELETE #destroy' do
    context "when admin deletes a product" do
      before do
        sign_in @admin
      end
      it 'delete product from application' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to(products_path)
      end
    end
  end

end
