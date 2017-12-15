get '/orders/new/3-item' do
  erb :'orders/new3'
end

get '/orders/new/5-item' do
  erb :'orders/new5'
end

post '/orders' do
  order_params = params[:order]
  @order = Order.create(order_params)

  redirect "/files"
end
