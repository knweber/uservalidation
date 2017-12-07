get '/orders' do
  erb :'orders/index'
end

get '/orders/new' do
  erb :'orders/new'
end

post '/orders' do
  order_items = params[:order][:items].keys
  customer_filename = params[:order][:customers][:filename]
  tempfile = params[:order][:customers][:tempfile]

  File.open(customer_filename, "w+") { |f| f.write(tempfile.read) }
  customer_list = CSV.parse(File.read(customer_filename).scrub)
  customer_list.shift
  verify_emails(customer_list)
  invalids = File.read('invalid_emails.txt')

  erb :'orders/index', locals: { invalid_emails: invalids, items: order_items }
end
