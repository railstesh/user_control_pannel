# README


- Ruby version => ruby '3.0.0'

- Rails version => 6.1.4

- Gem install bundle install

- Create Database rails db:create rails db:migrate

- To run rails server rails s
  - run on browser: localhost:3000

- To run test cases bundle exec rspec spec

- Added a Super Admin user on seed with my google ID.

- By Default when User login using google SSO user with role 'customer_support' will create

- Google SSO gem used : https://github.com/basecamp/google_sign_in

- Gem used for xlsx : gem 'roo', '~> 2.8', '>= 2.8.3'

- Rake task to import xlsx : ```bundle exec rails import:data``` (This will import provided xlsx to database)
