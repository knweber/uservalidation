require 'sinatra'
require 'shopify_api'
require 'httparty'


$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

base_url = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"


get '/orders/new' do
  # if Influencers have already been created from CSV
  if Influencer.count != 0
    erb :'orders/new'
  else
    redirect '/uploads/new'
  end
end

get '/orders/:id' do
  # HANDLE THIS
  erb :'orders/show', locals: { order_items: specific_items }
end



post '/orders' do

  collection_id = params[:order][:collection_id]

  collection_addon = "/custom_collections/#{collection_id}.json"
  total = base_url + collection_addon
  collection = HTTParty.get(total)
  collection_name = collection["custom_collection"]["title"]

  puts "Chosen collection below:"
  puts "       " + collection_name
  puts " "

  # holds product type with corresponding title and product id
  collection_items = {}

  collection_items_addon = "/products.json?collection_id=#{collection_id}"
  total = base_url + collection_items_addon
  products = HTTParty.get(total)

  puts "Items in Collection:"

  products["products"].each do |prod|
    puts "  "

    collection_items[prod["product_type"]] = [prod["title"],prod["id"]]

    puts "       " + prod["title"] + ", " + prod["product_type"]
  end

  selected_items = []
  params.each do |item|
    if collection_items[item]
      selected_items.push([item, collection_items[item]])
    end
  end

  puts "Selected Items for Order:"
  puts selected_items

  new_ticket = Ticket.create

  Influencer.all.each do |user|
    @order = Order.new({
      collection_id: collection_id,
      order_number: Order.order_number, # unique order ID per influencer
      influencer_id: user.id,
      ticket_id: new_ticket.id
    })
    if @order.valid?
      @order.save

      bra_size = user.bra_size
      top_size = user.top_size
      leggings_size = user.bottom_size
      jacket_size = user.sports_jacket_size

      selected_items.each do |item|
        prod_type = item[0]
        prod_title = item[1][0]
        prod_id = item[1][1]

        variants_addon = "/products/#{prod_id}/variants.json"

        total = base_url + variants_addon
        prod_variants = HTTParty.get(total)

        var_id = ""
        var_sku = ""

        prod_variants.each do |var|
          var_size = var["title"] # XS,S,M,L,XL
          if prod_type == "Leggings"
            if var_size == leggings_size
              var_id = var["id"]
              var_sku = var["sku"]
            end
          elsif prod_type == "Sports Bra"
            if var_size == bra_size
              var_id = var["id"]
              var_sku = var["sku"]
            end
          elsif prod_type = "Jacket"
            if var_size == jacket_size
              var_id = var["id"]
              var_sku = var["sku"]
            end
          elsif prod_type == "Tops"
            if var_size == top_size
              var_id = var["id"]
              var_sku = var["sku"]
            end
          elsif prod_type == "Wrap"
            if var_size == "ONE SIZE"
              var_id = var["id"]
              var_sku = var["sku"]
            end
          end
        end

        price_addon = "/variants/#{var_id}.json"

        total = base_url + price_addon
        price_response = HTTParty.get(total)
        var_price = price_response["price"]

        item_for_influencer_order = LineItem.new({
          product_type: prod_type,
          title: prod_title,
          variant_id: var_id,
          product_id: prod_id,
          sku: var_sku,
          price: var_price,
          order_id: @order.id
        })

        if item_for_influencer_order.valid?
          item_for_influencer_order.save
        else
          puts "Creation of line item for order #{@order.id} failed!"
          erb :'orders/new'
        end
      end
    else
      puts "Invalid order: #{@order}"
      erb :'orders/new'
    end
  end
  redirect '/tickets/new'
end
