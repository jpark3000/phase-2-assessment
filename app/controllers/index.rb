get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    redirect to('/dashboard')
  end
  erb :index
end
