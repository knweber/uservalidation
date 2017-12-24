SHOPIFY_ELLIE_3PACK_ID = ENV['SHOPIFY_ELLIE_3PACK_ID']
SHOPIFY_ELLIE_3PACK_PRODUCT = ENV['SHOPIFY_ELLIE_3PACK_PRODUCT']
INFLUENCER_SKU = ENV['INFLUENCER_SKU']
INFLUENCER_VARIANT_ID = ENV['INFLUENCER_VARIANT_ID']
SHOPIFY_ELLIE_3PACK_SKU = ENV['SHOPIFY_ELLIE_3PACK_SKU']
SHOPIFY_ELLIE_3PACK_VARIANT_ID = ENV['SHOPIFY_ELLIE_3PACK_VARIANT_ID']

# get '/influencers/:influencer_id/influencer_orders/new' do
#   @influencer = Influencer.find(params[:influencer_id])
#   erb :'influencer_orders/new'
# end

post '/influencer_orders' do
  Influencer.all.each do |user|
    
  end
  @influencer_order = InfluencerOrder.create(influencer_order_params)

  if @influencer_order.valid?
    redirect '/monthly_orders'
  end

end
