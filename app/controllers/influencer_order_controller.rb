SHOPIFY_ELLIE_3PACK_ID = ENV['SHOPIFY_ELLIE_3PACK_ID']
SHOPIFY_ELLIE_3PACK_PRODUCT = ENV['SHOPIFY_ELLIE_3PACK_PRODUCT']
INFLUENCER_SKU = ENV['INFLUENCER_SKU']
INFLUENCER_VARIANT_ID = ENV['INFLUENCER_VARIANT_ID']
SHOPIFY_ELLIE_3PACK_SKU = ENV['SHOPIFY_ELLIE_3PACK_SKU']
SHOPIFY_ELLIE_3PACK_VARIANT_ID = ENV['SHOPIFY_ELLIE_3PACK_VARIANT_ID']

get '/influencers/:influencer_id/influencer_orders/new' do
  @influencer = Influencer.find(params[:influencer_id])
  erb :'influencer_orders/new'
end

post '/influencers/:influencer_id/influencer_orders' do
  @influencer = Influencer.find(params[:influencer_id])

  influencer_order_params = params[:influencer_order]

  @influencer_order = InfluencerOrder.new(influencer_order_params)
  @influencer_order.generate_order_number

  if @influencer_order.save

end
