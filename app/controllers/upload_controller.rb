require 'sinatra'

enable :sessions


get '/uploads/new' do
  erb :'uploads/new'
end


post '/uploads' do

  influencer_data = params[:file][:tempfile].read

  influencer_rows = CSV.parse(influencer_data, headers: true, header_converters: :symbol)

  if !invalid_emails(influencer_rows)
    status 422

    invalids = File.read('invalid_emails.txt')

    # flash[:error] = "Some of the records you submitted are incorrect. Please fix the following records and try again."

    redirect '/uploads/new', locals: { incorrect_records: invalids }

  else
    influencer_rows.each do |user|
      create_influencer(user)
      @influencers = Influencer.all
      erb :'uploads/index'
    end
  end
end
