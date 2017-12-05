get '/orders' do
  erb :'orders/index'
end

get '/orders/new' do
  erb :'orders/new'
end

post '/orders' do
  redirect '/orders'
end
