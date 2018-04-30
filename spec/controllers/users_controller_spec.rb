require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: 'edson@example.com', password: '123456') }
  let(:user_2) { User.create!(email: 'ramirez@example.com', password: '123456') }

  describe 'Get #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq user
      end

    end

    context 'when a user is not logged in' do

      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when a user tries to view a different user Show page' do
      before do
        sign_in user_2
      end

      it 'redirects to root path' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
