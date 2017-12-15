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

    influencers_info = params[:file][:filename]
    tempfile = params[:file][:tempfile]

    File.open(influencers_info, "w+") { |f| f.write(tempfile.read) }

    influencer_list = CSV.parse(File.read(influencers_info).scrub)

    influencer_list.shift

    verify_emails(influencer_list)

    invalids = File.read('invalid_emails.txt')

    @influencers = Influencer.all

    erb :'files/index', locals: { invalid_emails: invalids }

end
