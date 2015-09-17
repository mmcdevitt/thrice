require 'rails_helper'

describe ListingsController do
  let(:user)    { Fabricate(:user) }

  describe 'GET #index' do
    context 'authenticated users' do
      before do
        sign_in user
        get :index
      end

      it 'has a successful response' do
        expect(response).to be_success
      end

      it 'renders the index template' do
        expect(response).to render_template :index
      end

      it 'sets the @listings variable' do
        listing = Fabricate(:listing, user_id: user.id)
        expect(assigns(:listings)).to eq([listing])
      end
    end
  end

  describe 'GET #show' do

  end
end