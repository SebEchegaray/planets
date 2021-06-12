def db_actions execution
  connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'planets_app'})
  results = connection.exec(execution)
  connection.close

  results
end