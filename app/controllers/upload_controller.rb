require 'sinatra'
require 'httparty'
require 'shopify_api'

enable :sessions

$apikey = ENV['ELLIE_STAGING_API_KEY']
$password = ENV['ELLIE_STAGING_PASSWORD']
$shopname = ENV['SHOPNAME']

base = ShopifyAPI::Base.site = "https://#{$apikey}:#{$password}@#{$shopname}.myshopify.com/admin"


get '/uploads/new' do
  p "*****"

  product = ShopifyAPI::Product.where(title: "Sleet Legging October")
    product.each do |product|
      # p product
      # p product.id
      p "______________"
    end

  product2 = ShopifyAPI::Product.where(title:  "Wanderlust")
  product2.each do |prod|
    p prod.id
  end

  mystuff = ShopifyAPI::Metafield.all(params: {resource: 'variants', resource_id: 5163971444768, fields: 'key, value'})

  p mystuff
  # variant_meta_test = ShopifyAPI::Variant.find(27320650437)
  #
  # # all_metafields = variant_meta_test.metafields
  # p variant_meta_test
  # all_metafields.each do |mymeta|
  #   puts "#{mymeta.key}, #{mymeta.value}"
  #   if mymeta.key == 'Discontinued'
  #     puts "Found Discountinued" #below changes value mymeta.value = 'false' mymeta.save
  #   end
  # end

  # p variant_meta_test
  # collect = ShopifyAPI::Collect.find(:all, :params => { :collection_id => my_collect_id, :limit => 250, :page => collect_page })
  # p collect
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
