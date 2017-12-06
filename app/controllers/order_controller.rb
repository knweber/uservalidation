get '/orders' do
  erb :'orders/index'
end

get '/orders/new' do
  erb :'orders/new'
end

post '/orders' do
  params[:order].inspect
  p params[:order].inspect
  redirect '/orders'
end
