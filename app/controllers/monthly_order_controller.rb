require 'rest-client'
require 'sinatra'
require 'shopify_api'
require 'json'

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"




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
   # master_product = ShopifyAPI::Product.where(id: params[:order][:master_prod_id])

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

  master_product = ShopifyAPI::Collect.where(id: params[:monthly_order][:master_prod_id])

  leggings_checked? = params[:monthly_order][:leggings]
  bra_checked? = params[:monthly_order][:sports_bra]
  top_checked? = params[:monthly_order][:top]
  jacket_checked? = params[:monthly_order][:sports_jacket]
  wrap_checked? = params[:monthly_order][:wrap]

  @monthly_order = MonthlyOrder.create(monthly_order_params)



  # p "TITLE INPUTTED BELOW:"
  # p "You have entered #{inputted_title} in the form"
  #
  # master_prod = ShopifyAPI::Collect.where(title: inputted_title)

  # Find products for a collection by the collection title? What should the user enter as a collection/product identifier?

  redirect "/monthly_orders/#{@monthly_order.id}"
end
