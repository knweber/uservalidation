get '/influencers/:influencer_id/orders/new' do
  @influencer = Influencer.find(params[:influencer_id])
  erb :'orders/new'
end

get '/influencers/:influencer_id/orders/:id' do
  @order = Order.find(params[:id])
  @influencer = Influencer.find(@order.influencer_id)
  erb :'orders/show'
end

post '/influencers/:influencer_id/orders' do
  order_params = params[:order]

  @order = Order.create(order_params)

  redirect "/influencers/#{@order.influencer_id}/orders/#{@order.id}"
end
