require 'csv'

get '/tickets/new' do
  erb :'tickets/new'
end

post '/tickets' do
  @ticket = Ticket.create

  puts "Ticket filename is " + @ticket.filename

  Order.all.each do |order|
    order.ticket_id = @ticket.id
  end

  monthly_csv = create_csv_file(@ticket.id)

  # download output CSV
  content_type('application/csv')
  attachment(monthly_csv)
end
