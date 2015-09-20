require 'rails_helper' 

describe OrdersController do 
  let(:user) { Fabricate(:user) }

  describe 'POST create' do 
    before do 
      sign_in user
    end

    context 'with a successful charge' do 
      it 'sets the flash success message' do 
        charge = double('charge')
        charge.stub(:successful).and_return(true)
        StripeWrapper::Charge.stub(:create).and_return(charge)

        post :create, token: '123'
        expect(flash[:success]).to be_present
      end

      it 'redirects to the new payment path' do 

      end
    end

    context 'with an error charge' do 

    end
  end
end