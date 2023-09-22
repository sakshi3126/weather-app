require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:valid_user) { create(:user, email: 'test@example.com', password: 'password123') }

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs in the user and redirects to the root path' do
        post :create, params: { session: { email: valid_user.email, password_digest: 'password123' } }
        expect(session[:user_id]).to eq(valid_user.id)
        expect(flash[:notice]).to eq('Login successful')
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'does not log in the user and redirects to the login page' do
        post :create, params: { session: { email: 'invalid@example.com', password_digest: 'invalid_password' } }
        expect(session[:user_id]).to be_nil
        expect(flash[:notice]).to eq('Invalid Email or Password')
        expect(response).to redirect_to('/login')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to the login page' do
      session[:user_id] = valid_user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(flash[:notice]).to eq('Logged Out')
      expect(response).to redirect_to('/login')
    end
  end
end
