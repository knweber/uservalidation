enable :sessions

get '/sessions/new' do
  erb :'sessions/new'
end

# post '/sessions' do
  # --authenticate user (but which records?)--
  # if user
    # sessions[:user_id] = user.id
    # redirect '/orders/new'
  # else
    # status 422
    # erb :'sessions/new', locals: { errors: ["Invalid login credentials."] }
  # end
# end

delete '/sessions/:id' do
  sessions[:user_id] = nil
  redirect '/'
end
