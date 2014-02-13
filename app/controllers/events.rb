post '/create_event' do
  Event.create( user_id: session[:user_id],
                name: params[:name],
                location: params[:location],
                starts_at: params[:starts_at],
                ends_at: params[:ends_at])

  redirect to('/dashboard')



end
