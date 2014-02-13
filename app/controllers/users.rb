post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect to('/dashboard')
  else
    redirect to('/')
  end
end

post '/signup' do
  @user = User.new( first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    birthdate: params[:birthdate] )
  @user.password = params[:password]
  @user.save

  if @user.valid?
    session[:user_id] = @user.id
    redirect to('/dashboard')
  else
    @errors_array = @user.errors.full_messages
    redirect to('/')
  end
end

get '/dashboard' do
  if session[:user_id]
    erb :dashboard
  else
    redirect to('/')
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end
