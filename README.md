# Invoice Generator - Login System

A full-stack application with Laravel backend API and React frontend, featuring secure authentication using Laravel Sanctum.

## Features

- ✅ Secure login authentication with Laravel Sanctum
- ✅ Token-based API authentication
- ✅ React frontend with protected routes
- ✅ Beautiful and modern UI
- ✅ Automatic redirect to dashboard after login
- ✅ Logout functionality
- ✅ User session management

## Tech Stack

### Backend
- Laravel 12
- Laravel Sanctum (API Authentication)
- PHP 8.2+

### Frontend
- React 19
- React Router DOM
- Axios
- CSS3

## Setup Instructions

### Backend Setup

1. **Navigate to backend directory:**
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   composer install
   ```

3. **Set up environment file:**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

4. **Configure database in `.env`:**
   ```env
   DB_CONNECTION=sqlite
   # Or use your preferred database
   ```

5. **Run migrations:**
   ```bash
   php artisan migrate
   ```

6. **Create a test user (optional):**
   ```bash
   php artisan tinker
   ```
   Then run:
   ```php
   User::create([
       'name' => 'Test User',
       'email' => 'test@example.com',
       'password' => Hash::make('password'),
   ]);
   ```

7. **Start Laravel server:**
   ```bash
   php artisan serve
   ```
   The API will be available at `http://localhost:8000`

### Frontend Setup

1. **Navigate to frontend directory:**
   ```bash
   cd frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment file:**
   Create a `.env` file in the frontend directory:
   ```env
   REACT_APP_API_URL=http://localhost:8000/api
   ```

4. **Start React development server:**
   ```bash
   npm start
   ```
   The app will be available at `http://localhost:3000`

## API Endpoints

### Public Endpoints
- `POST /api/login` - Login with email and password
  ```json
  {
    "email": "user@example.com",
    "password": "password"
  }
  ```

### Protected Endpoints (Require Authentication Token)
- `GET /api/me` - Get current authenticated user
- `POST /api/logout` - Logout current user

## Authentication Flow

1. User enters email and password on the login page
2. Frontend sends POST request to `/api/login`
3. Backend validates credentials and returns a token
4. Token is stored in localStorage
5. Token is included in Authorization header for subsequent requests
6. On successful login, user is redirected to dashboard
7. Protected routes check for valid token
8. On logout, token is removed from localStorage

## File Structure

### Backend
```
backend/
├── app/
│   ├── Http/
│   │   └── Controllers/
│   │       └── AuthController.php
│   └── Models/
│       └── User.php
├── routes/
│   └── api.php
├── config/
│   └── sanctum.php
└── bootstrap/
    └── app.php
```

### Frontend
```
frontend/
├── src/
│   ├── components/
│   │   ├── Login.js
│   │   ├── Login.css
│   │   ├── Dashboard.js
│   │   ├── Dashboard.css
│   │   └── ProtectedRoute.js
│   ├── context/
│   │   └── AuthContext.js
│   ├── services/
│   │   └── api.js
│   └── App.js
```

## Security Features

- Password hashing using bcrypt
- Token-based authentication
- CSRF protection (disabled for API routes)
- CORS configuration
- Token expiration handling
- Automatic logout on token expiration

## Default Test Credentials

If you created a test user:
- Email: `test@example.com`
- Password: `password`

**Note:** Remember to change the password in production!

## Troubleshooting

### CORS Issues
If you encounter CORS errors, make sure:
1. The frontend URL is included in `SANCTUM_STATEFUL_DOMAINS` in `.env`
2. The API URL in frontend `.env` matches your Laravel server URL

### Token Issues
- Check browser console for token storage
- Verify token is being sent in Authorization header
- Clear localStorage if experiencing authentication issues

### Database Issues
- Ensure database file exists (for SQLite)
- Run migrations: `php artisan migrate`
- Check `.env` database configuration

## Next Steps

- Add user registration
- Implement password reset functionality
- Add email verification
- Implement refresh tokens
- Add role-based access control

## License

MIT

