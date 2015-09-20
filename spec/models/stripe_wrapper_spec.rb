require 'rails_helper' 

describe StripeWrapper::Charge do 
  let(:token) do 
    Stripe::Token.create(
      card: {
        number: card_number,
        exp_month: 1,
        exp_year: 2020,
        cvc: 191
      }
    ).id 
  end

  before do 
    StripeWrapper.set_api_key
  end

  context 'with valid credit card' do 
    let(:card_number) { '4242424242424242' }

    it 'charges the card successfully', :vcr do 
      response = StripeWrapper::Charge.create(
          amount: 300,
          card: token,
          currency: 'usd'
        )
      expect(response).to be_successful
    end
  end

  context 'with invalid credit card' do 
    let(:card_number) { '4000000000000002' }
    let(:response) do 
      StripeWrapper::Charge.create(
        amount: 300,
        card: token,
        currency: 'usd'
      )
    end

    it 'does not charge the card', :vcr do 
      expect(response).to_not be_successful
    end

    it 'contains an error message', :vcr do 
      expect(response.error_message).to eq('Your card was declined.')
    end
  end
end