require 'sinatra'
require 'csv'
require 'date'

get '/uploads' do
  erb :'uploads/index'
end

get '/uploads/new' do
  erb :'uploads/new'
end

post '/uploads' do
  filename = params[:file][:filename]
  tempfile = params[:file][:tempfile]

  File.open(filename, "w+") { |f| f.write(tempfile.read) }
  contents = CSV.parse(File.read(filename).scrub)
  verify_emails(contents)
  invalids = File.read('invalid_emails.txt')
  erb :'uploads/index', locals: { contents: invalids }
end
