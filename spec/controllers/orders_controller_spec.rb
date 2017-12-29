require 'spec_helper'

xdescribe 'Order Controller' do

  context 'get /orders/new route' do

    xcontext 'after valid CSV submission' do

      it 'should respond successfully to the /orders/new route' do
        get '/orders/new'
        expect(last_response.status).to eq(200)
      end

      it 'should display a form' do
        get '/orders/new'
        expect(last_response.body).to include('<form id=\'monthly-3-order-form\'')
      end

    end

    context 'after invalid CSV submission' do

      it 'should redirect' do
        get '/orders/new'
        expect(last_response.status).to eq(302)
      end

      it 'should redirect to /uploads/new' do
        get '/orders/new'
        expect(last_response.location).to include('/uploads/new')
      end

    end
  end

  xcontext 'post /orders route' do

    it 'should redirect after submission' do
    end

  end

end
