get '/orders' do
  if session[:user_id] != nil
    erb :'orders/index'
  else
    redirect '/sessions/new'
  end
end

get '/orders/new' do
  if session[:user_id] != nil
    erb :'orders/new'
  else
    redirect '/sessions/new'
  end
end

post '/orders' do
  if session[:user_id] != nil
    order_items = params[:order][:items].keys
    customer_filename = params[:order][:customers][:filename]
    tempfile = params[:order][:customers][:tempfile]

    File.open(customer_filename, "w+") { |f| f.write(tempfile.read) }
    customer_list = CSV.parse(File.read(customer_filename).scrub)
    customer_list.shift
    verify_emails(customer_list)
    if customer_list.length > 0
      invalids = File.read('invalid_emails.txt')
      erb :'orders/index', locals: { invalid_emails: invalids, items: order_items }
    else
      erb :'orders/index'
    end
  else
    redirect '/sessions/new'
  end
end
