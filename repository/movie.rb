def get_all_movies(conn)
  conn.exec( "select * from movie" ) do |results|
    results.map { |result| Movie.new(result) }
  end
end

def save_movie(conn, movie)
  conn.exec( "insert into movie values(#{movie.id}, '#{movie.title}', '#{movie.release_date}')" )
end

def delete_movie(conn, movie_id)
  conn.exec( "delete from movie where id = #{movie_id}" ).cmd_tuples == 1
end
