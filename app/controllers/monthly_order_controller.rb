require 'rest-client'
require 'sinatra'
require 'shopify_api'
require 'json'

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"


# idk = ShopifyAPI::Product.where(title: "Leggings").first.variants.first

# "?namespace=ellie_order_info&value=product_collection"

# total_url = my_url + my_addon
# puts total_url
# response = RestClient.get(total_url)
# puts response



get '/monthly_orders' do
  # my_url = "https://#{apikey}:#{password}@#{shopname}.myshopify.com/admin"
  # my_addon = "/metafields.json?namespace=ellie_order_info"
  #
  # total_url = my_url + my_addon
  # puts total_url
  # response = HTTParty.get(total_url)
  # puts response

  erb :'monthly_orders/index'
end

get '/monthly_orders/new/3-item' do
  # if CSV document has already been processed
  if Influencer.count != 0
    erb :'monthly_orders/new3'
  else
    redirect '/uploads/new'
  end
end

get '/monthly_orders/new/5-item' do
  # if CSV document has already been processed
  if Influencer.count != 0
    erb :'monthly_orders/new5'
  else
    redirect '/uploads/new'
  end
end

get '/monthly_orders/:id' do
  @monthly_order = MonthlyOrder.find(params[:id])

  items = {
    leggings: 'Leggings',
    sports_bra: 'Sports Bra',
    sports_jacket: 'Jacket',
    top: 'Top',
    wrap: 'Wrap'
  }

  monthly_order_items = []

  @monthly_order.attributes.each do |attr_name, attr_value|
    if attr_value == true && items[attr_name]
      monthly_order_items.push(items[attr_name])
    end
  end

  erb :'monthly_orders/show', locals: { order: @monthly_order }
end

post '/monthly_orders' do
  monthly_order_params = params[:monthly_order]
  @monthly_order = MonthlyOrder.create(monthly_order_params)

  p "***********"
  collection_title = params[:monthly_order][:name]
  p collection_title
  p "//////////////////////"
  p ShopifyAPI::Collect.where(title: collection_title).last
  p "______________"
  id_for_coll = ShopifyAPI::Collect.where(title: collection_title).last.collection_id
  # item = ShopifyAPI::Product.where(collection_id: collectid)
  # p item.last.title
  p "||||||||||||||||||||"

  redirect "/monthly_orders/#{@monthly_order.id}"
end
