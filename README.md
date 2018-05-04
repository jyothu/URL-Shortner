# README

Build a small link shortener service with an API as well as a small web front-end :
  - The link shortener should be able to receive a URL and give back a shortened URL.
  - When a user accesses the shortened URL he should be redirected to the full URL.
  - It should have an API endpoint where you can query stats around a particular shortened URL giving you details about the users that have visited the URL with as much information as you can get on that person.


Things you may want to cover:

* Ruby version
  
  `ruby 2.4.0`

* System dependencies
  - `Linux / Mac OS`
  - `RVM`
  - `Ruby On Rails 5.0.1`
  - `MySQL - >= Distrib 5.6.33, for debian-linux-gnu (x86_64)`

* Configuration
   - Configure database in `config/database.yml`

* Database creation
  - `bundle exec rails db:create`
  - `bundle exec rails db:setup`

* Database initialization
  - `bundle exec rails db:seed`


* Services (job queues, cache servers, search engines, etc.)
  - No Jobs as of now

* API Documentation
  - `curl -X POST -d "url[original_url]=google.com" "localhost:3000/api/v1/urls.json"`
  - {"url":{"original_url":"github.com","shortened_url":"http://localhost:3000/bVhDaS","created_at":"2018-05-03T09:31:08.000Z"}

