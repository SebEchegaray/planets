require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'

enable :sessions

require_relative 'db/db'
require_relative 'models/planet_method'
require_relative 'models/user'
require_relative 'helpers/sessions_helper'
require_relative 'controllers/planets_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'

get '/' do
  redirect '/info'
end

# 1. Add a new file in helpers/session.rb (make sure it's linked up in main)
#    -- Create a method for is_logged_in?
#    -- Replace in index.erb with the method
# 2. Replace our Welcome, user_id, with Welcome, email!
#    -- Create a method in helpers/session.rb
#    -- current_user
#    -- -- look up the user in the database based on session[:user_id]
#           (add find_user_by_id method in the user model)
#    -- -- Return nil if there is no user
# 3. Add a logout button that makes a `delete request` to `/sessions`
#    -- in sessions controller
#    -- set sessions[:user_id] = nil

# password hashing
# password_digest = BCrypt::Password.create(password)
# We need to do this inside our method to create a user 'create_user' method
# Then call our SQL thing with the password_digest parsed in
# We need to change the name in the schema file too to password_digest