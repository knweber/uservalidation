get '/monthly_orders/new/3-item' do
  erb :'monthly_orders/new3'
end

get '/monthly_orders/new/5-item' do
  erb :'monthly_orders/new5'
end

get '/monthly_orders/:id' do
  @monthly_order = Monthly_Order.find(params[:id])

  items = {
    leggings: 'Leggings',
    sports_bra: 'Sports Bra',
    sports_jacket: 'Jacket',
    top: 'Top',
    wrap: 'Wrap'
  }

  monthly_order_items = []

  @monthly_order.attributes.each do |attr_name, attr_value|
    if attr_value == true && attr_name != :three_item
      monthly_order_items.push(items[attr_name])
    end
  end

  erb :'monthly_orders/show', locals: { items: monthly_order_items }
end

post '/monthly_orders' do
  monthly_order_params = params[:monthly_order]
  @monthly_order = Monthly_Order.create(monthly_order_params)

  redirect "/monthly_orders/#{@monthly_order.id}"
end