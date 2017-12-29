require 'sinatra'
require_relative '../helpers/validation_helper'

enable :sessions
include ValidationHelpers

get '/uploads/new' do
  if Order.any?
    Order.destroy_all
  end
  erb :'uploads/new'
end

post '/uploads' do
  File.open('invalid_emails.txt','a+') do |file|
    file.truncate(0)
  end

  influencer_data = params[:file][:tempfile].read
  influencer_rows = CSV.parse(influencer_data, headers: true, header_converters: :symbol)

  if !invalid_emails(influencer_rows)
    status 422
    @invalids = File.read('invalid_emails.txt')
    return erb :'uploads/new', locals: { errors: ["Some of the records you submitted are incorrect. Please fix the following records and try again."], invalids: @invalids }
  else
    Influencer.destroy_all
    influencer_rows.each do |user|
      create_influencer(user)
    end
      @influencers = Influencer.all
      erb :'uploads/index'
  end
end
