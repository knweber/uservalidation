require 'spec_helper'
require 'factory_bot'

describe 'Order Controller' do

  before(:each) do
    Influencer.destroy_all
  end

  context 'get /orders/new route' do

    context 'after valid CSV submission' do

      it 'should respond successfully to the /orders/new route' do
        FactoryBot.create(:influencer)
        get '/orders/new'
        expect(last_response.status).to eq(200)
      end

      it 'should display an order form' do
        FactoryBot.create(:influencer)
        get '/orders/new'
        expect(last_response.body).to include("<form class=\"order-form field\"")
      end

    end

    context 'after invalid CSV submission' do

      it 'should redirect' do
        get '/orders/new'
        expect(last_response.status).to eq(302)
      end

      it 'should redirect to uploads/new' do
        get '/orders/new'
        expect(last_response.location).to include('/uploads/new')
      end
    end
  end

  xcontext 'post /orders route' do

    it 'should redirect after submission' do
    end

    it "should find the product with the given product id" do
    end

    it "should find the influencer with the given influencer id" do
    end

    it "should find the product variant for the specific customer" do
    end

    it "should find the sku of the specific product variant" do
    end

    it "should create a new order in the database" do
    end

    it "should create an order belonging to the monthly ticket" do
    end

    it "should create an order belonging to the given influencer" do
    end

    it 'generates a csv file listing all of the influencers\' orders' do
      influencer4 = FactoryBot.create(:influencer)
      ticket4 = FactoryBot.create(:ticket)
      order4 = FactoryBot.create(:order, influencer_id: influencer4.id, ticket_id: ticket4.id)
      contents = File.open(ticket4.filename)
      expect(contents).to include('sku')
    end

  end

end
