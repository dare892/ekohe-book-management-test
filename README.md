# Book Management System

### Features
- Create user with email, password and initial balance
- log in to return auth token
- See user profile with current balance
- Query list of books
- Rent a book if in stock and balance is greater than price
- Return a book
- Show book with income

### To Run Locally, have Rails (6+) installed. After you clone the repo:

```
bundle install
bundle exec rake db:create db:migrate
rails s
```

### Dependencies
* bcrypt
* jwt
* faker (seed data)
* jsonapi-serializer
* postgresql
* rspec

### Deployed at:
https://book-management-test-ekohe.herokuapp.com/

### Design ideas, assumptions made
- Tables : User, Book, BookRental
- Rails api-only server
- Relational database (posgres) due to foreign keys
- Basic http requests with Authorization header for identification.
- Requirements pdf stated fee deduction at the return of a book, but it made more sense to deduct at the beginning of the rental.
- Controller(request) tests set up

### API Documentation found at
https://documenter.getpostman.com/view/9443682/TVep7nT2

### Additional Good-to-know Gotchas/Features
* Would have committed more frequently if I were to collaborate, but it was a simple app with just me workng on it so there's not much commit history.
* basic testing framework in place.
* Spent ~3 hours total.
