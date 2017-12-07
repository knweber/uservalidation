get '/orders' do
  erb :'orders/index'
end

get '/orders/new' do
  erb :'orders/new'
end

post '/orders' do
  order_hash = {}
  items = []
  if(params[:order])
    order_hash = params[:order]
    items = order_hash.keys
  end
  erb :'orders/index', locals: { params: items }
end
