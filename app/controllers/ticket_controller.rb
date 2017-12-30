require 'sinatra'
require_relative './order_controller'

get '/tickets/:id' do
  @ticket = Ticket.find(params[:id])
  # @influencers = Influencer.all
  # @line_items = LineItem.all
  # erb :'tickets/show', locals: { ticket: @ticket, influencers: @influencers, line_items: @line_items }
  p @ticket.filename
  create_csv_file(@ticket.id)
  send_file(@ticket.filename, :filename => @ticket.filename)
end
