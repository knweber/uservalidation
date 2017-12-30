require 'sinatra'
require_relative './order_controller'

get '/tickets/:id' do
  @ticket = Ticket.find(params[:id])

  erb :'tickets/show', locals: { ticket: @ticket }


  # create_csv_file(@ticket.id)
  # send_file(@ticket.filename, :filename => @ticket.filename)
end

get '/tickets/:id/download' do
  @ticket = Ticket.find(params[:id])
  p @ticket.filename
  create_csv_file(@ticket.id)
  send_file(@ticket.filename, :filename => @ticket.filename)
end
