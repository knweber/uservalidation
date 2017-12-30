require 'spec_helper'
require 'rack/test'

describe 'Upload Controller' do
  include Rack::Test::Methods

  before(:each) do
    Influencer.destroy_all
  end

  context 'get /uploads/new route' do

    it 'should respond successfully to the /uploads/new route' do
      get '/uploads/new'
      expect(last_response.status).to eq(200)
    end

    it 'should display a form' do
      get '/uploads/new'
      expect(last_response.body).to include("<form id=\"upload-form\"")
    end

    it 'should erase any existing orders' do
      get '/uploads/new'
      expect(Order.count).to eq(0)
    end

  end

  context 'post /uploads route' do

    context 'valid CSV entries' do
      it 'should have a status of 200 after submission' do
        post '/uploads', 'file' => Rack::Test::UploadedFile.new('valid_influencers_sample_upload.csv',
        'application/csv')
        expect(last_response.status).to eq(200)
      end

      it 'will create users in the database' do
        post '/uploads', 'file' => Rack::Test::UploadedFile.new('valid_influencers_sample_upload.csv',
        'application/csv')
        expect(Influencer.all.count).to eq(4)
      end
    end

    context 'invalid CSV entries' do
      it 'should have a status of 422' do
        post '/uploads', 'file' => Rack::Test::UploadedFile.new('invalid_influencers_sample_upload.csv',
        'application/csv')
        expect(last_response.status).to eq(422)
      end

      it 'will not create users in the database' do
        post '/uploads', 'file' => Rack::Test::UploadedFile.new('invalid_influencers_sample_upload.csv',
        'application/csv')
        expect(Influencer.all.count).to eq(0)
      end


    end

  end

end
