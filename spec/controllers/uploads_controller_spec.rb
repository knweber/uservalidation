require 'spec_helper'

describe 'Upload Controller' do

  context 'get /uploads/new route' do

    it 'should respond successfully to the /uploads/new route' do
      get '/uploads/new'
      expect(last_response.status).to eq(200)
    end

    it 'should display a form' do
      get '/uploads/new'
      expect(last_response.body).to include("<form id=\"upload-form\"")
    end

  end

  xcontext 'post /uploads route' do

    context 'valid CSV entries' do
      it 'should have a status of 302 after submission' do
      end

      it 'should render uploads#index' do
      end
    end

    context 'invalid CSV entries' do
      it 'should redirect after submission' do
      end

      it 'should redirect to /uploads/new after submission' do
      end

      it 'should display an error message' do
      end
    end

  end

end
