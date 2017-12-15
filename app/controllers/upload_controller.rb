get '/upload/new' do
  # Erase invalid user information from .txt file when uploading a new form
  File.open('../invalid_emails.txt','w') do |f|
    f.truncate(0)
  end
  erb :'files/new'
end


post '/uploads' do

    influencer_data = params[:file][:tempfile].read

    influencer_rows = CSV.parse(influencer_data, headers: true, header_converters: :symbol)

    verify_emails(influencer_rows)

    invalids = File.read('invalid_emails.txt')

    @influencers = Influencer.all

    erb :'upload/index', locals: { invalid_emails: invalids }

end
