require 'spec_helper'

describe 'Order Controller' do
  context 'get /orders/new route' do
    it 'should respond successfully to the /orders/new route' do
      get '/orders/new'
      expect(last_response.status).to eq(200)
    end

    it 'should display a form' do
      get '/orders/new'
      expect(last_response.body).to include('<form id=\'order-form\'')
    end

  end

  context 'post /orders route' do
    context 'valid order' do
      it 'should redirect after submission' do
        post '/orders'
        expect(last_response.status).to eq(302)
      end
      it 'should redirect to /orders after submission' do
        post '/orders'
        expect(last_response.location).to include('/orders')
      end
    end

    context 'invalid order' do
      it 'should have a status of 422' do
        post '/orders'
        expect(last_response.status).to eq(422)
      end

      it 'should redirect to /orders/new after submission' do
        post '/orders'
        expect(last_response.location).to include('/orders/new')
      end

      it 'should include the error message' do
      end

    end

    it 'should redirect if not logged in' do
      expect(last_response.status).to eq(302)
    end

    it 'should redirect to /sessions/new if not logged in' do
      expect(last_response.location).to include('/sessions/new')
    end


  end

end
