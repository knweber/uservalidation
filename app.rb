require 'sinatra'
require 'sinatra/activerecord'

# Disregard this file for right now -- planning to add the call limit checks here

class App < ActiveRecord::Base

  $apikey = ENV['ELLIE_STAGING_API_KEY']
  $password = ENV['ELLIE_STAGING_PASSWORD']
  $shopname = ENV['SHOPNAME']

  $header_info = ShopifyAPI::response.header["HTTP_X_SHOPIFY_SHOP_API_CALL_LIMIT"]

  $shop_url = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"

  ShopifyAPI::Base.site = $shop_url

  # def check_shopify_call_limit(headerinfo, shop_wait)
  #     puts "raw Shopify call limit info: #{headerinfo}"
  #     header_data = headerinfo.split('/')
  #     my_numerator = header_data[0].to_i
  #     my_denominator = header_data[1].to_i
  #     percentage = (my_numerator/my_denominator.to_f).round(2)
  #     puts "Used #{percentage} of Shopify call limits"
  #     if percentage >= 0.7
  #       puts "Sleeping #{shop_wait}"
  #       sleep shop_wait
  #     end
  # end


end
