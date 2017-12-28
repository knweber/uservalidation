require 'sinatra'
require 'shopify_api'

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"

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
  # HANDLE THIS
  erb :'orders/show', locals: { order_items: specific_items }
end

post '/orders' do
  collection_id = order[:collection_id]
  collection = ShopifyAPI::CustomCollection.find(collection_id)
  puts "Chosen collection below:"
  puts collection
  
  selection = []
  params[:order].each do |item|
      selection.push(item)
  end
  selection.shift  # removes collection_id

  puts "Selected Items for Order:"
  puts selection

  Influencer.all.each do |user|
    new_order = create_order(user,selection,collection_id)
    # STUFF HERE
  end

  redirect '/tickets/new'
end
