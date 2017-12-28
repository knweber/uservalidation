require 'sinatra'
require 'httparty'
require 'shopify_api'
require_relative '../helpers/validation_helper'

enable :sessions
include ValidationHelpers

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

base = ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"

get '/uploads/new' do

  collection_items = {}
  addon = "/products.json?collection_id=19622330400"
  total = base + addon
  products = HTTParty.get(total)
  puts "Collection Items:"
  products["products"].each do |prod|
    puts "  "
    collection_items[prod["product_type"]] = [prod["title"],prod["id"]]
    puts "       " + prod["title"] + ", " + prod["product_type"]
  end
  puts "***********"
  puts collection_items
  # puts "***********"
  # collection_id = 386209925

  # collection = ShopifyAPI::Collect.find(:all, :params => {:collection_id => collection_id})

  # p collection

  # master_product = ShopifyAPI::Product.where(title: "Power Moves - 3 Item", id: 409385271328, fields: 'variants')
  # p variant_meta_test
  # p "||||||||||||||"

  # p ShopifyAPI::Product.where(id: 485063950368, fields: "title")
  # all_metafields = variant_meta_test.metafields
  # p all_metafields
  # all_metafields.each do |mymeta|
  #   puts "#{mymeta.key}, #{mymeta.value}"
  #   if mymeta.key == 'Discontinued'
  #     puts "Found Discountinued" #below changes value mymeta.value = 'false' mymeta.save
  #   end
  # end

  # (params: {resource: 'variants', resource_id: 5163866357792, fields: 'key,value'})
  # p prod

  # my_url = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"
  # my_addon = "/products/409385271328/metafields.json"
  #
  # total_url = my_url + my_addon
  # puts total_url
  # response = HTTParty.get(total_url)
  # puts "********************"
  # puts response

  erb :'uploads/new'
end

post '/uploads' do
  File.open('invalid_emails.txt','a+') do |file|
    file.truncate(0)
  end

  influencer_data = params[:file][:tempfile].read
  influencer_rows = CSV.parse(influencer_data, headers: true, header_converters: :symbol)

  if !invalid_emails(influencer_rows)
    status 422
    @invalids = File.read('invalid_emails.txt')
    return erb :'uploads/new', locals: { errors: ["Some of the records you submitted are incorrect. Please fix the following records and try again."], invalids: @invalids }
  else
    Influencer.destroy_all
    influencer_rows.each do |user|
      create_influencer(user)
    end
      @influencers = Influencer.all
      erb :'uploads/index'
  end
end
