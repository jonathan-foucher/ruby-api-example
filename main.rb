require_relative 'dto/movie'
require_relative 'repository/movie'
require 'pg'
require 'sinatra'

before do
  $conn = PG.connect("postgres://postgres:postgres@localhost:5432/my_database")
end

get '/api/movies' do
  puts "Get all movies"
  content_type :json
  get_all_movies($conn).to_json
end

post '/api/movies' do
  request.body.rewind
  movie = Movie.new(JSON.parse(request.body.read))
  puts "Post movie id=#{movie.id}, title='#{movie.title}' and relase_date=#{movie.release_date}"
  save_movie($conn, movie)
  200
end

delete '/api/movies/:movieId' do |movie_id|
  puts "Delete movie with id #{movie_id}"
  delete_movie($conn, movie_id) ? 200 : 204
end
