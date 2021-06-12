def all_planets()
  db_actions("SELECT * FROM planets")
end

def create_planet(name, diameter, distance, mass, moon_count, image_url)
  sql_query = "INSERT INTO planets(name, image_url, diameter, distance, mass, moon_count) VALUES('#{name}', '#{image_url}', #{diameter}, #{distance}, #{mass}, #{moon_count})"
  db_actions(sql_query)
end

def update_planet(name, diameter, distance, mass, moon_count, image_url, id)
  sql_query = "UPDATE planets SET name = '#{name}', image_url = '#{image_url}', diameter = #{diameter}, distance = #{distance}, mass = #{mass}, moon_count = #{moon_count} WHERE id = #{id}"
  db_actions(sql_query)
end

def delete_planet(id)
  sql_query = "DELETE FROM planets WHERE id = #{id}"
  db_actions(sql_query)
end

# THIS IS FOR CREATING OUR USER TABLE WITH EMAIL AND PASSWORD PARSED AS HASH SO IT'S ENCRYPTED
# require 'bcrypt'

# def create_user(email, password)
#   password_digest = BCrypt::Password.create(password)

#   sql_query = "INSERT INTO users(email, password_digest) VALUES('#{email}', '#{password_digest}');";
#   run_sql(sql_query)
# end