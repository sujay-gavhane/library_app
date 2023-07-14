# Library App

Steps to Setup
  1. install ruby 3.0.0
  2. install rails 7.0.5
  3. Clone the app
  4. update database.yml to set PG username and password
  5. run `bundle install`
  6. run `rails db:create`
  7. run `rails db:migrate`
  8. run `rails s`
  9. to run tests run `rspec`

Models
  1. Library
  2. Book
  3. User

APIs
  1. /api/v1/users (POST, GET, PUT, PATCH, DELETE) **Users APIs**
  2. /auth/login (POST) **JWT Token creation API for Authentication**
  3. /api/v1/libraries (POST, GET, PUT, PATCH, DELETE) **Libraries APIs**
  4. /api/v1/libraries/{library_id}/books (POST, GET, PUT, PATCH, DELETE) **Books API to add update or delete book in library**
  5. /api/v1/libraries/{library_id}/users (GET, PUT, PATCH, DELETE) *Users API to add users to library*
  6. /api/v1/users/{user_id}/books (GET, PUT, PATCH, DELETE) *Books API to assign books to users*
