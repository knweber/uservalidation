require 'spec_helper'

describe 'MonthlyOrder Controller' do

  xcontext 'get /monthly_orders/new route' do

    it 'should respond successfully to the /monthly_orders/new route' do
      get '/monthly_orders/new'
      expect(last_response.status).to eq(200)
    end

    it 'should display a form' do
      get '/monthly_orders/new'
      expect(last_response.body).to include('<form id=\'monthly-order-form\'')
    end

  end

  xcontext 'post /monthly_orders route' do

    it 'should redirect after submission' do
    end

    it 'should redirect to /monthly_orders/:id after submission' do
    end

  end

  xcontext 'get/monthly_orders/:id route' do
  end

end
