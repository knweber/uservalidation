post '/tickets' do
  @influencer_orders = InfluencerOrder.all

  @ticket = Ticket.new
  @ticket.assign_filename

  content_type('application/csv')
  attachment(@ticket.filename)

  generate_ticket
end
