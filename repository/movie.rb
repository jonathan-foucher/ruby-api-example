def get_all_movies(conn)
  conn.exec( "select * from movie" ) do |results|
    results.map { |result| Movie.new(result) }
  end
end
