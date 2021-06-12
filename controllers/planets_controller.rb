get '/info' do
  planets = all_planets()
  erb :'info/index', locals: { planet: planets }
end

get '/info/add' do
  erb :'info/new', locals: { edit: false }
end

post '/info' do
  name = params[:name]
  diameter = params[:diameter]
  distance = params[:distance]
  mass = params[:mass]
  moon_count = params[:moon_count]
  image_url = params[:image_url]

  create_planet(name, diameter, distance, mass, moon_count, image_url)

  redirect '/'
end

# Display individual planet
get '/info/:id' do |id|
  planet = db_actions("SELECT * FROM planets WHERE id = #{id}")
  erb :'info/show', locals: { edit: true, info: planet[0] }
end

# Update individual planet
get '/info/:id/edit'do |id|
  planet = db_actions("SELECT * FROM planets WHERE id = #{id}")
  erb :'info/new', locals: { edit: true, info: planet[0] }
end

put '/info/:id/add' do |id|
  name = params[:name]
  diameter = params[:diameter]
  distance = params[:distance]
  mass = params[:mass]
  moon_count = params[:moon_count]
  image_url = params[:image_url]

  update_planet(name, diameter, distance, mass, moon_count, image_url, id)

  redirect "/info/#{id}"
end

delete '/info/:id/delete' do |id|
  delete_planet(id)

  redirect '/'
end