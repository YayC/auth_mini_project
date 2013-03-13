

get '/' do
  # Look in app/views/index.erb
  redirect '/login'
  
end

get '/login' do
  erb :index
end

post '/login' do 
  if User.authenticate(params[:email], params[:password])
    token = SecureRandom.hex(10)
    session[:token] = token
    user = User.find_by_email(params[:email])
    user.token_id = token
    user.save
    redirect ('/secret')
  else
    redirect ('/login')
  end
end



post '/signup' do
  if params[:password] == params[:confirm_password]
    pass = BCrypt::Password.create(params[:password])
    User.create(email: params[:email], password_hash: pass)
    redirect ('/secret')
  else
    redirect ('/')
  end
end

get '/secret' do
  if User.find_by_token_id(session[:token])
    "the secret is: 42."
    erb :secret
  else
    redirect ('/login')
  end
  
end


delete '/signout' do
  session[:token] = nil 
  redirect '/'
end




