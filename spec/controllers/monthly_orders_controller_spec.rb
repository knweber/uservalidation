require 'spec_helper'

describe 'MonthlyOrder Controller' do

  context 'get /monthly_orders/new/3-item route' do

    xcontext 'after valid CSV submission' do

      it 'should respond successfully to the /monthly_orders/new/3-item route' do
        get '/monthly_orders/new/3-item'
        expect(last_response.status).to eq(200)
      end

      it 'should display a form' do
        get '/monthly_orders/new'
        expect(last_response.body).to include('<form id=\'monthly-3-order-form\'')
      end
    end

    context 'after invalid CSV submission' do

      it 'should redirect' do
        get '/monthly_orders/new/3-item'
        expect(last_response.status).to eq(302)
      end

      it 'should redirect to /uploads/new' do
        get '/monthly_orders/new/3-item'
        expect(last_response.location).to include('/uploads/new')
      end

    end

  end

  context 'get /monthly_orders/new/5-item route' do

    xcontext 'after valid CSV submission' do

      it 'should respond successfully to the /monthly_orders/new/5-item route' do
        get '/monthly_orders/new/5-item'
        expect(last_response.status).to eq(200)
      end

      it 'should display a form' do
        get '/monthly_orders/new'
        expect(last_response.body).to include('<form id=\'monthly-5-order-form\'')
      end
    end

    context 'after invalid CSV submission' do

      it 'should redirect' do
        get '/monthly_orders/new/5-item'
        expect(last_response.status).to eq(302)
      end

      it 'should redirect to /uploads/new' do
        get '/monthly_orders/new/5-item'
        expect(last_response.location).to include('/uploads/new')
      end

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
