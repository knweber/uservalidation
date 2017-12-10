require 'spec_helper'

decribe 'Sessions Controller' do

  context 'get sessions/new' do
    it 'should respond to the /sessions/new route' do
      get '/sessions/new'
      expect(last_response.status).to eq(200)
    end

    it 'should display a form' do
      get '/sessions/new'
      expect(last_response.body).to include('<form class=\'session_form\'')
    end

  end

  xcontext 'post /sessions' do
    context 'valid user' do
      it 'redirects to /orders/new' do
      end
    end

    context 'invalid user' do
      it 'redirects to /sessions/new' do
      end

      it 'gives errors if it gets invalid credentials' do
      end

      it 'gives a 422 if it gets invalid user info' do
      end
    end

  end

  xcontext 'delete /sessions/:id' do
    before(:each) do
      # post '/sessions' with valid user email
    end

    it 'should redirect' do
      delete '/sessions/1'
      expect(last_response.status).to eq(302)
    end

    it 'should redirect to /sessions/new' do
      delete '/sessions/1'
      expect(last_response.location).to include('/sessions/new')
    end

    it 'should clear the session' do
      session = {}
      delete '/sessions/1', 'rack.session' => session
      expect(session[:user_id]).to be nil
    end
  end

end
