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
    erb :'monthly_orders/new3'
  else
    redirect '/uploads/new'
  end
end

get '/orders/new/5-item' do
  # if CSV document has already been processed
  if Influencer.count != 0
    erb :'monthly_orders/new5'
  else
    redirect '/uploads/new'
  end
end

get '/orders/:id' do
  # @monthly_order = MonthlyOrder.find(params[:id])

  items = {
    leggings: 'Leggings',
    sports_bra: 'Sports Bra',
    sports_jacket: 'Jacket',
    top: 'Top',
    wrap: 'Wrap'
  }

  monthly_order_items = []

  specific_items = ShopifyAPI::Product.where(collection_id: @monthly_order.master_prod_id)

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
  master_prod_id = params[:order][:master_prod_id]
  master_prod_name = params[:order][:master_prod_name]

  master_prod = ShopifyAPI::Product.where(title: master_prod_name, id: master_prod_id)


  @monthly_order = MonthlyOrder.create(params[:monthly_order])

  redirect "/orders/#{@order.id}"
end
