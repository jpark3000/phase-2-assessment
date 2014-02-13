post '/create_event' do
  Event.create(user_id: session[:user_id],
               name: params[:name],
               location: params[:location],
               starts_at: DateTime.new,
               ends_at: DateTime.new)

  redirect to('/dashboard')



end

get '/edit/:event_id' do
  @event = Event.find(params[:event_id])

  erb :edit_event
end

post '/edit_event/:event_id' do
  Event.update(params[:event_id],
               name: params[:name],
               location: params[:location],
               starts_at: params[:starts_at],
               ends_at: params[:ends_at])
  redirect to('/dashboard')
end

get '/delete/:event_id' do
  Event.destroy(params[:event_id])
  redirect to('/dashboard')
end
