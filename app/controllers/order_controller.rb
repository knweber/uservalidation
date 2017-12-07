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
    if(items.length == 3 || items.length == 5)
      erb :'orders/index', locals: { items: items }
    else
      status 422
      erb :'orders/new'
    end
  end

end
