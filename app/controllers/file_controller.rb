# get '/files' do
#   # if !Influencer.first
#   #   erb :'files/new'
#   # else
#     @influencers = Influencer.all
#     erb :'files/index', locals: { influencers: @influencers }
#   # end
# end

get '/files/new' do
  erb :'files/new'
end

post '/files' do
  # if session[:user_id] != nil
    p '*********************'

    customer_filename = params[:file][:filename]
    tempfile = params[:file][:tempfile]

    File.open(customer_filename, "w+") { |f| f.write(tempfile.read) }

    customer_list = CSV.parse(File.read(customer_filename).scrub)

    customer_list.shift

    verify_emails(customer_list)

    invalids = File.read('invalid_emails.txt')

    p Influencer.first

    @influencers = Influencer.all

    erb :'files/index', locals: { invalid_emails: invalids }

end
