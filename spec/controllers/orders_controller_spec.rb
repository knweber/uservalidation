require 'spec_helper'
require 'factory_bot'

xdescribe 'Order Controller' do

  context 'get /orders/new route' do

    xcontext 'after valid CSV submission' do

      it 'should respond successfully to the /orders/new route' do
        get '/orders/new'
        expect(last_response.status).to eq(200)
      end

      it 'should display a form' do
        get '/orders/new'
        expect(last_response.body).to include("<form class=\"order-form field\"")
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

    xit 'generates a csv file listing all of the influencers\' orders' do
      influencer4 = FactoryBot.create(:influencer)
      ticket4 = FactoryBot.create(:ticket)
      order4 = FactoryBot.create(:order, influencer_id: influencer4.id, ticket_id: ticket4.id)
      contents = File.open(ticket4.filename)
      expect(contents).to include('sku')
    end

  end

end
