get '/orders' do
  # if session[:user_id] != nil
  #   erb :'orders/index'
  # else
  #   redirect '/sessions/new'
  # end
end

get '/orders/new' do

  # if session[:user_id] != nil
    erb :'orders/new'
  # else
  #   redirect '/sessions/new'
  # end
end
