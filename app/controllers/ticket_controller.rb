post '/tickets' do
  @influencer_orders = InfluencerOrder.all

  content_type('application/csv')
end
