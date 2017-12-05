require 'sinatra'
require 'csv'
require 'date'

get '/' do
  redirect '/uploads/new'
end

get '/uploads' do
  erb :index
end

get '/uploads/new' do
  erb :new
end

post '/uploads' do
  filename = params[:file][:filename]
  tempfile = params[:file][:tempfile]

  File.open(filename, "w+") { |f| f.write(tempfile.read) }
  contents = CSV.parse(File.read(filename).scrub)
  verify_emails(contents)
  invalids = File.read('invalid_emails.txt')
  erb :index, locals: { contents: invalids }
end
