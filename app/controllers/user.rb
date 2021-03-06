enable :sessions

get '/login' do
  erb :login
end

post '/login' do
  if user = User.find_by_email(params[:email])
    if user.password == params[:password]
      session[:email] = user.email
      redirect '/'
    else
      @error_message = "Password incorrect."
      erb :login
    end
  else
    @error_message = "User email not found."
    erb :login
  end
end

get '/logout' do
  session[:email] = nil
  redirect '/'
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.new(name: params[:name], email: params[:email], update_frequency: params[:update_frequency])
  user.password = params[:password]
  begin
    if user.save!
      session[:email] = User.find_by_email(params[:email]).email
      redirect '/'
    end
  rescue
    redirect '/register'
  end
end
