get '/tickets/:id' do
  @ticket = Ticket.find(params[:id])
  @influencers = Influencer.all
  @line_items = LineItem.all
  erb :'tickets/show', locals: { ticket: @ticket, influencers: @influencers, line_items: @line_items }
end
