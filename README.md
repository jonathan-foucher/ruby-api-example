## Introduction
This project is an example of a Ruby API using Sinatra and a postgres database.

## Run the project
### Database
Install postgres locally or run it through docker with :
```
docker run -p 5432:5432 -e POSTGRES_DB=my_database -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres
```

You will need to run the this request to create the movie table :
```
create table movie (
    id              integer         primary key,
    title           varchar(50)     not null,
    release_date    date            not null
);
```

### Install the Gems
You can use Bundler to install the required Gems
```
bundle install
```

### Application
Once the postgres database is started, the movie table created and the Gems installed, you can start the Ruby project and try it out.

Start the application
```
ruby main.rb -p 3000
```

Get all the movies
```
curl --location 'http://localhost:3000/api/movies'
```

Save a movie
```
curl --request POST \
  --url http://localhost:3000/api/movies \
  --header 'Content-Type: application/json' \
  --data '{
	"id": 26,
	"title": "Some movie title",
	"release_date": "2022-02-26"
}'
```

Delete a movie
```
curl --request DELETE \
  --url http://localhost:3000/api/movies/26
```
