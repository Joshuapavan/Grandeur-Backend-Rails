# Grandeur Backend API

A Ruby on Rails API backend for the Grandeur car marketplace application.

## Requirements

- Ruby 3.0.4
- Rails 7.0.5
- SQLite3 (development/test)
- PostgreSQL (production)

## Setup

1. Clone the repository
2. Install dependencies:
```bash
bundle install
```
3. Setup database:
```bash
rails db:create
rails db:migrate
```
4. Start the server:
```bash
rails server
```

## API Endpoints

### Users
- `POST /users/sign_up` - Register a new user
- `GET /users/verify_email` - Verify user email
- `POST /users/login` - User login

### Cars
- `POST /cars/new` - Create a new car listing
- `GET /cars/all` - Get all car listings
- `GET /cars/search` - Search cars by name, brand, or model
- `DELETE /cars/delete` - Delete car listings

## Admin Panel

Access the admin panel at `/admin`. Features include:
- User management
- Car listings management
- Analytics dashboard
- Email verification status

## Dependencies

- Active Admin - Admin interface
- Devise - Authentication for admin
- Mailgun - Email service
- JWT - Token authentication
- Active Model Serializers - JSON serialization
- Rack CORS - Cross-Origin Resource Sharing

## Testing

Run the test suite:
```bash
rails test
```

## API Documentation

Full API documentation available at:
https://api.postman.com/collections/25610988-a1e5e10a-f219-46bc-aea8-72ab2882e409?access_key=PMAT-01H2DMPA8C0GP94KK9VCQDA9HF

## Development

For local development, emails are sent to letter_opener at:
http://localhost:3000/letter_opener
