get '/' do
  erb :index
end


# TODO: convert this route to use AJAX
post '/rolls' do
  # If the user passes-in a "value", let's use it. Otherwise, we'll generate a random one.
  # See: roll_if_value_is_nil method in the Roll model.
  value = params[:value] ? params[:value].to_i : nil

  @roll = value ? Roll.create({ value: value }) : Roll.create
  
  if request.xhr?
    erb :_die_image, layout: false, locals: {roll: @roll} 
  else
    erb :index
  end
end
