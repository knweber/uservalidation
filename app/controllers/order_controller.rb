require 'sinatra'
require 'shopify_api'

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"

# get '/monthly_orders' do
  # my_url = "https://#{apikey}:#{password}@#{shopname}.myshopify.com/admin"
  # my_addon = "/metafields.json?namespace=ellie_order_info"
  #
  # total_url = my_url + my_addon
  # puts total_url
  # response = HTTParty.get(total_url)
  # puts response

#   erb :'monthly_orders/index'
# end

get '/orders/new/3-item' do
  # if CSV document has already been processed
  if Influencer.count != 0
    erb :'orders/new3'
  else
    redirect '/uploads/new'
  end
end

get '/orders/new/5-item' do
  # if CSV document has already been processed
  if Influencer.count != 0
    erb :'orders/new5'
  else
    redirect '/uploads/new'
  end
end

get '/orders/:id' do

  items = {
    leggings: 'Leggings',
    sports_bra: 'Sports Bra',
    sports_jacket: 'Jacket',
    top: 'Top',
    wrap: 'Wrap'
  }

  monthly_order_items = []

  specific_items = ShopifyAPI::Product.where(collection_id: @order.master_prod_id)

  puts "|||||||||"
  puts "SPECIFIC ITEMS:"
  puts specific_items

  # @monthly_order.attributes.each do |attr_name, attr_value|
  #   if attr_value == true && items[attr_name]
  #     monthly_order_items.push(items[attr_name])
  #   end
  # end
  erb :'orders/show', locals: { order_items: specific_items }
end

post '/orders' do
  order_params = params[:order]
  Influencer.all.each do |user|
    order_params[:influencer_id] = user.id
    order = Order.new(order_params)
  end

  redirect '/tickets/new'


  # master_prod = ShopifyAPI::Product.where(title: master_prod_name, id: master_prod_id)

  # redirect "/orders/#{@order.id}"
end
