# Invoice Generator

> A modern, full-stack invoice management application built with Laravel and React, featuring secure authentication and a responsive user interface.

[![Laravel](https://img.shields.io/badge/Laravel-12-FF2D20?style=flat-square&logo=laravel)](https://laravel.com)
[![React](https://img.shields.io/badge/React-19-61DAFB?style=flat-square&logo=react)](https://reactjs.org)
[![PHP](https://img.shields.io/badge/PHP-8.2+-777BB4?style=flat-square&logo=php)](https://www.php.net)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Project Structure](#project-structure)
- [Security](#security)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

Invoice Generator is a comprehensive web application designed for managing invoices, clients, and companies. The application features a robust authentication system with username-based login, real-time form validation, and secure token-based API authentication using Laravel Sanctum.

### Key Highlights

- **Secure Authentication**: Token-based authentication with Laravel Sanctum
- **Modern UI/UX**: Beautiful, responsive interface with smooth animations
- **Real-time Validation**: Inline form validation with visual feedback
- **Protected Routes**: Secure route protection with automatic redirects
- **RESTful API**: Well-structured API endpoints for seamless frontend-backend communication

## ✨ Features

### Authentication & Security
- ✅ Username-based authentication system
- ✅ Secure token-based API authentication (Laravel Sanctum)
- ✅ Password hashing using bcrypt
- ✅ Protected routes with automatic authentication checks
- ✅ Token expiration handling with automatic logout
- ✅ CSRF protection for web routes

### User Interface
- ✅ Modern, responsive login page design
- ✅ Inline form validation with real-time feedback
- ✅ Password visibility toggle
- ✅ Smooth animations and transitions
- ✅ Error message display with visual indicators
- ✅ Loading states and disabled states during operations
- ✅ Intuitive dashboard interface

### User Experience
- ✅ Automatic redirect to dashboard after successful login
- ✅ Session persistence across page refreshes
- ✅ User-friendly error messages
- ✅ Responsive design for all screen sizes
- ✅ Accessible form controls and labels

## 🛠 Tech Stack

### Backend
- **Framework**: [Laravel 12](https://laravel.com) - PHP web framework
- **Authentication**: [Laravel Sanctum](https://laravel.com/docs/sanctum) - API token authentication
- **Language**: PHP 8.2+
- **Database**: SQLite (default) / MySQL / PostgreSQL

### Frontend
- **Library**: [React 19](https://reactjs.org) - JavaScript UI library
- **Routing**: [React Router DOM](https://reactrouter.com) - Client-side routing
- **HTTP Client**: [Axios](https://axios-http.com) - Promise-based HTTP client
- **Styling**: CSS3 with modern animations and transitions

## 📦 Prerequisites

Before you begin, ensure you have the following installed on your system:

- **PHP** >= 8.2
- **Composer** >= 2.0
- **Node.js** >= 18.0
- **npm** >= 9.0 (comes with Node.js)
- **Database** (SQLite, MySQL, or PostgreSQL)
- **Git** (for version control)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/invoice-generator.git
cd invoice-generator
```

### 2. Backend Setup

Navigate to the backend directory and install dependencies:

```bash
cd backend
composer install
```

### 3. Environment Configuration

Copy the example environment file and generate an application key:

```bash
cp .env.example .env
php artisan key:generate
```

### 4. Database Configuration

Update the `.env` file with your database configuration:

```env
DB_CONNECTION=sqlite
# Or for MySQL/PostgreSQL:
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=invoice_generator
# DB_USERNAME=root
# DB_PASSWORD=
```

For SQLite, ensure the database file exists:

```bash
touch database/database.sqlite
```

### 5. Run Database Migrations

```bash
php artisan migrate
```

### 6. Create a Test User (Optional)

You can create a test user using Laravel Tinker:

```bash
php artisan tinker
```

Then execute:

```php
use App\Models\User;
use Illuminate\Support\Facades\Hash;

User::create([
    'name' => 'admin',
    'email' => 'admin@example.com',
    'password' => Hash::make('password'),
]);
```

### 7. Start the Laravel Development Server

```bash
php artisan serve
```

The API will be available at `http://localhost:8000`

### 8. Frontend Setup

Open a new terminal, navigate to the frontend directory, and install dependencies:

```bash
cd frontend
npm install
```

### 9. Frontend Environment Configuration

Create a `.env` file in the frontend directory:

```bash
cp .env.example .env
```

Update the `.env` file:

```env
REACT_APP_API_URL=http://localhost:8000/api
```

### 10. Start the React Development Server

```bash
npm start
```

The application will be available at `http://localhost:3000`

## ⚙️ Configuration

### Backend Configuration

#### Sanctum Configuration

The Sanctum configuration file is located at `backend/config/sanctum.php`. Ensure your frontend domain is included in the `stateful` domains array:

```php
'stateful' => explode(',', env('SANCTUM_STATEFUL_DOMAINS', sprintf(
    '%s%s',
    'localhost,localhost:3000,127.0.0.1,127.0.0.1:8000,::1',
    Sanctum::currentApplicationUrlWithPort()
))),
```

#### CORS Configuration

CORS is automatically handled by Laravel. Ensure your frontend URL is correctly configured in the `.env` file if you need custom CORS settings.

### Frontend Configuration

#### API URL Configuration

Update the `REACT_APP_API_URL` in the frontend `.env` file to match your backend API URL:

```env
REACT_APP_API_URL=http://localhost:8000/api
```

## 📖 Usage

### Accessing the Application

1. Open your browser and navigate to `http://localhost:3000`
2. You will be redirected to the login page
3. Enter your username and password
4. Upon successful authentication, you will be redirected to the dashboard

### Default Test Credentials

If you created a test user:
- **Username**: `admin`
- **Password**: `password`

> **⚠️ Important**: Change the default password in production environments!

## 📚 API Documentation

### Base URL

```
http://localhost:8000/api
```

### Authentication

All protected endpoints require an authentication token in the Authorization header:

```
Authorization: Bearer {token}
```

### Endpoints

#### Public Endpoints

##### Login

Authenticate a user and receive an access token.

**Endpoint**: `POST /api/login`

**Request Body**:
```json
{
  "username": "admin",
  "password": "password"
}
```

**Success Response** (200 OK):
```json
{
  "user": {
    "id": 1,
    "name": "admin",
    "email": "admin@example.com",
    "created_at": "2025-11-07T18:00:00.000000Z",
    "updated_at": "2025-11-07T18:00:00.000000Z"
  },
  "token": "1|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "message": "Login successful"
}
```

**Error Response** (422 Unprocessable Entity):
```json
{
  "message": "The provided credentials are incorrect.",
  "errors": {
    "username": ["The provided credentials are incorrect."]
  }
}
```

#### Protected Endpoints

##### Get Current User

Get the currently authenticated user's information.

**Endpoint**: `GET /api/me`

**Headers**:
```
Authorization: Bearer {token}
```

**Success Response** (200 OK):
```json
{
  "user": {
    "id": 1,
    "name": "admin",
    "email": "admin@example.com",
    "created_at": "2025-11-07T18:00:00.000000Z",
    "updated_at": "2025-11-07T18:00:00.000000Z"
  }
}
```

##### Logout

Invalidate the current access token.

**Endpoint**: `POST /api/logout`

**Headers**:
```
Authorization: Bearer {token}
```

**Success Response** (200 OK):
```json
{
  "message": "Logged out successfully"
}
```

## 📁 Project Structure

```
invoice-generator/
├── backend/                 # Laravel backend application
│   ├── app/
│   │   ├── Http/
│   │   │   └── Controllers/
│   │   │       └── AuthController.php
│   │   └── Models/
│   │       └── User.php
│   ├── bootstrap/
│   │   └── app.php         # Application bootstrap
│   ├── config/
│   │   └── sanctum.php     # Sanctum configuration
│   ├── database/
│   │   ├── migrations/     # Database migrations
│   │   └── seeders/        # Database seeders
│   ├── routes/
│   │   └── api.php         # API routes
│   └── .env.example        # Environment variables example
│
├── frontend/               # React frontend application
│   ├── public/             # Static files
│   └── src/
│       ├── components/     # React components
│       │   ├── Login.js
│       │   ├── Login.css
│       │   ├── Dashboard.js
│       │   ├── Dashboard.css
│       │   └── ProtectedRoute.js
│       ├── context/        # React context
│       │   └── AuthContext.js
│       ├── services/       # API services
│       │   └── api.js
│       └── App.js          # Main application component
│
├── .gitignore             # Git ignore rules
├── README.md              # Project documentation
└── LICENSE                # License file
```

## 🔒 Security

### Implemented Security Features

- **Password Hashing**: All passwords are hashed using bcrypt
- **Token Authentication**: Secure token-based authentication with Laravel Sanctum
- **CSRF Protection**: CSRF tokens for web routes (disabled for API routes)
- **CORS Configuration**: Properly configured CORS for cross-origin requests
- **Input Validation**: Server-side validation for all user inputs
- **Token Expiration**: Automatic token expiration and cleanup
- **Secure Headers**: Appropriate security headers in API responses

### Security Best Practices

- Never commit `.env` files to version control
- Use strong passwords in production
- Regularly update dependencies
- Use HTTPS in production
- Implement rate limiting for API endpoints
- Keep Laravel and dependencies up to date

## 🐛 Troubleshooting

### Common Issues

#### CORS Errors

**Problem**: Cross-origin requests are blocked.

**Solution**:
1. Verify the frontend URL is included in `SANCTUM_STATEFUL_DOMAINS` in the backend `.env` file
2. Ensure the `REACT_APP_API_URL` in frontend `.env` matches your Laravel server URL
3. Check that both servers are running on the expected ports

#### Authentication Token Issues

**Problem**: Token not being sent or recognized.

**Solution**:
1. Check browser console for token storage in localStorage
2. Verify the token is included in the Authorization header
3. Clear localStorage and login again
4. Check token expiration settings in Sanctum configuration

#### Database Connection Errors

**Problem**: Unable to connect to the database.

**Solution**:
1. Verify database configuration in `.env` file
2. Ensure database file exists (for SQLite)
3. Check database permissions
4. Run migrations: `php artisan migrate`
5. Verify database server is running (for MySQL/PostgreSQL)

#### Port Already in Use

**Problem**: Port 8000 or 3000 is already in use.

**Solution**:
1. Stop other applications using the ports
2. Use different ports:
   - Laravel: `php artisan serve --port=8001`
   - React: Update `package.json` scripts or use `PORT=3001 npm start`

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow PSR-12 coding standards for PHP
- Follow ESLint rules for JavaScript/React
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Omer Tariq** - *Initial work* - [GitHub](https://github.com/omer-github93/)

## 🙏 Acknowledgments

- [Laravel](https://laravel.com) - The PHP Framework for Web Artisans
- [React](https://reactjs.org) - A JavaScript library for building user interfaces
- [Laravel Sanctum](https://laravel.com/docs/sanctum) - Lightweight authentication system for SPAs

## 📞 Support

For support, email omer.hamajan@gmail.com or open an issue in the repository.

---

**Made with ❤️ using Laravel and React**
