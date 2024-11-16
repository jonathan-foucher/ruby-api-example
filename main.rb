require 'sinatra'
require_relative 'dto/movie'

get '/api/movies' do
  puts "Get all movies"
  "Get all movies"
end

post '/api/movies' do
  request.body.rewind
  movie = Movie.new(JSON.parse(request.body.read))
  puts "Post movie id=#{movie.id}, title='#{movie.title}' and relase_date=#{movie.release_date}"
  200
end

delete '/api/movies/:movieId' do |movie_id|
  puts "Delete movie with id #{movie_id}"
  200
end
