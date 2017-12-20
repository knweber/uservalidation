post '/tickets' do
  influencer_orders = InfluencerOrder.all

  @ticket = Ticket.new
  @ticket.assign_filename
  @ticket.save

  influencer_orders.each do |order|
    if order.ticket_id != nil
      order.ticket_id = @ticket.id
    end
  end

  puts "Ticket filename is " + @ticket.filename
  monthly_csv = create_csv_file(@ticket.filename)

  content_type('application/csv')
  attachment(monthly_csv)
end
