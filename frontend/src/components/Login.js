import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import './Login.css';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});
  const [serverError, setServerError] = useState('');
  const [loading, setLoading] = useState(false);
  const { login, isAuthenticated } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (isAuthenticated) {
      navigate('/dashboard');
    }
  }, [isAuthenticated, navigate]);

  const validateField = (name, value) => {
    let error = '';
    if (!value || value.trim() === '') {
      error = `${name === 'username' ? 'Username' : 'Password'} is required`;
    }
    return error;
  };

  const handleBlur = (field) => {
    setTouched({ ...touched, [field]: true });
    const value = field === 'username' ? username : password;
    const error = validateField(field, value);
    setErrors({ ...errors, [field]: error });
  };

  const handleChange = (field, value) => {
    if (field === 'username') {
      setUsername(value);
    } else {
      setPassword(value);
    }

    // Clear error when user starts typing
    if (errors[field]) {
      setErrors({ ...errors, [field]: '' });
    }
    if (serverError) {
      setServerError('');
    }
  };

  const validateForm = () => {
    const newErrors = {};
    let isValid = true;

    const usernameError = validateField('username', username);
    const passwordError = validateField('password', password);

    if (usernameError) {
      newErrors.username = usernameError;
      isValid = false;
    }

    if (passwordError) {
      newErrors.password = passwordError;
      isValid = false;
    }

    setErrors(newErrors);
    setTouched({ username: true, password: true });
    return isValid;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setServerError('');

    if (!validateForm()) {
      return;
    }

    setLoading(true);

    try {
      const result = await login(username, password);
      if (result.success) {
        navigate('/dashboard');
      } else {
        setServerError(result.error);
      }
    } catch (err) {
      setServerError('An unexpected error occurred. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const togglePasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  return (
    <div className="login-container">
      <div className="login-card">
        {/* Left Side - Welcome & Illustration */}
        <div className="login-left">
          <div className="welcome-text">Welcome</div>
          <div className="illustration-wrapper">
            {/* Inline SVG: Isometric phone with charts - white/light-teal only */}
            <svg viewBox="0 0 280 220" fill="none" xmlns="http://www.w3.org/2000/svg" className="login-illustration">
              {/* Phone body - isometric left face */}
              <polygon points="60,80 140,35 200,72 120,117" fill="rgba(255,255,255,0.9)" stroke="rgba(255,255,255,0.4)" strokeWidth="1" />
              {/* Phone body - isometric right face */}
              <polygon points="200,72 200,145 120,190 120,117" fill="rgba(255,255,255,0.65)" stroke="rgba(255,255,255,0.3)" strokeWidth="1" />
              {/* Phone body - isometric top face (screen) */}
              <polygon points="60,80 60,152 120,190 120,117 200,72 200,72 140,35 60,80" fill="rgba(255,255,255,0.08)" />
              {/* Screen area on top face */}
              <polygon points="72,88 130,53 186,82 128,117" fill="rgba(255,255,255,0.18)" stroke="rgba(255,255,255,0.5)" strokeWidth="0.5" />

              {/* Bar chart bars on screen - teal tones */}
              {/* Bar 1 */}
              <polygon points="80,112 85,108 91,112 86,116" fill="rgba(255,255,255,0.9)" />
              <polygon points="80,100 85,96 85,108 80,112" fill="rgba(255,255,255,0.7)" />
              <polygon points="85,96 91,100 91,112 85,108" fill="rgba(200,245,241,0.8)" />
              {/* Bar 2 */}
              <polygon points="92,108 97,104 103,108 98,112" fill="rgba(255,255,255,0.9)" />
              <polygon points="92,90 97,86 97,104 92,108" fill="rgba(255,255,255,0.7)" />
              <polygon points="97,86 103,90 103,108 97,104" fill="rgba(200,245,241,0.8)" />
              {/* Bar 3 */}
              <polygon points="104,104 109,100 115,104 110,108" fill="rgba(255,255,255,0.9)" />
              <polygon points="104,95 109,91 109,100 104,104" fill="rgba(255,255,255,0.7)" />
              <polygon points="109,91 115,95 115,104 109,100" fill="rgba(200,245,241,0.8)" />
              {/* Bar 4 */}
              <polygon points="116,100 121,96 127,100 122,104" fill="rgba(255,255,255,0.9)" />
              <polygon points="116,82 121,78 121,96 116,100" fill="rgba(255,255,255,0.7)" />
              <polygon points="121,78 127,82 127,100 121,96" fill="rgba(200,245,241,0.8)" />

              {/* Line chart */}
              <polyline points="80,100 92,88 104,93 116,80 128,86 140,74 152,80"
                stroke="rgba(255,255,255,0.95)" strokeWidth="2" fill="none" strokeLinecap="round" strokeLinejoin="round" />
              {/* Line chart dots */}
              <circle cx="80" cy="100" r="2" fill="white" opacity="0.9" />
              <circle cx="92" cy="88" r="2" fill="white" opacity="0.9" />
              <circle cx="104" cy="93" r="2" fill="white" opacity="0.9" />
              <circle cx="116" cy="80" r="2.5" fill="white" />
              <circle cx="128" cy="86" r="2" fill="white" opacity="0.9" />
              <circle cx="140" cy="74" r="3" fill="white" />
              <circle cx="152" cy="80" r="2" fill="white" opacity="0.9" />

              {/* Floating mini cards above phone */}
              {/* Card 1 */}
              <rect x="155" y="30" width="48" height="28" rx="5" fill="rgba(255,255,255,0.15)" stroke="rgba(255,255,255,0.5)" strokeWidth="1" />
              <rect x="160" y="37" width="16" height="3" rx="1.5" fill="rgba(255,255,255,0.8)" />
              <rect x="160" y="43" width="10" height="3" rx="1.5" fill="rgba(255,255,255,0.5)" />
              <circle cx="188" cy="42" r="6" fill="rgba(255,255,255,0.2)" stroke="rgba(255,255,255,0.6)" strokeWidth="1" />
              <text x="188" y="46" textAnchor="middle" fontSize="7" fill="white" opacity="0.9">$</text>

              {/* Card 2 */}
              <rect x="30" y="48" width="42" height="26" rx="5" fill="rgba(255,255,255,0.12)" stroke="rgba(255,255,255,0.4)" strokeWidth="1" />
              <rect x="35" y="55" width="14" height="2.5" rx="1.2" fill="rgba(255,255,255,0.7)" />
              <rect x="35" y="60" width="20" height="2.5" rx="1.2" fill="rgba(255,255,255,0.4)" />
              {/* Mini pie chart */}
              <circle cx="60" cy="59" r="7" fill="none" stroke="rgba(255,255,255,0.5)" strokeWidth="2" />
              <path d="M60,59 L60,52 A7,7 0 0,1 66,63 Z" fill="rgba(255,255,255,0.6)" />

              {/* Donut/ring chart to the right */}
              <circle cx="175" cy="115" r="22" fill="none" stroke="rgba(255,255,255,0.2)" strokeWidth="8" />
              <circle cx="175" cy="115" r="22" fill="none" stroke="rgba(255,255,255,0.8)" strokeWidth="8"
                strokeDasharray="70 69" strokeDashoffset="17" strokeLinecap="round" />
              <circle cx="175" cy="115" r="22" fill="none" stroke="rgba(200,245,241,0.6)" strokeWidth="8"
                strokeDasharray="35 104" strokeDashoffset="-53" strokeLinecap="round" />
              <text x="175" y="120" textAnchor="middle" fontSize="10" fill="white" fontWeight="bold">74%</text>

              {/* Floating sparkle stars */}
              <circle cx="220" cy="55" r="2.5" fill="rgba(255,255,255,0.6)" />
              <circle cx="45" cy="140" r="2" fill="rgba(255,255,255,0.4)" />
              <circle cx="230" cy="140" r="1.5" fill="rgba(255,255,255,0.5)" />
              <circle cx="165" cy="170" r="1.5" fill="rgba(255,255,255,0.3)" />
            </svg>
          </div>
          <div className="left-subtitle">INTRODUCING INVOICE GENERATOR</div>
        </div>


        {/* Right Side - Login Form */}
        <div className="login-right">
          <h2 className="login-title">LOGIN</h2>

          <form onSubmit={handleSubmit} className="login-form" noValidate>
            {serverError && <div className="error-message server-error">{serverError}</div>}

            <div className="form-group">
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => handleChange('username', e.target.value)}
                onBlur={() => handleBlur('username')}
                placeholder="Username"
                disabled={loading}
                className={errors.username && touched.username ? 'error' : ''}
              />
              <div className="input-icon-wrapper">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="input-icon">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
              </div>
              {errors.username && touched.username && (
                <span className="field-error">{errors.username}</span>
              )}
            </div>

            <div className="form-group">
              <div className="password-input-wrapper">
                <input
                  type={showPassword ? 'text' : 'password'}
                  id="password"
                  value={password}
                  onChange={(e) => handleChange('password', e.target.value)}
                  onBlur={() => handleBlur('password')}
                  placeholder="password"
                  disabled={loading}
                  className={errors.password && touched.password ? 'error' : ''}
                />
                <button
                  type="button"
                  className="password-toggle"
                  onClick={togglePasswordVisibility}
                  disabled={loading}
                  aria-label={showPassword ? 'Hide password' : 'Show password'}
                >
                  {showPassword ? (
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="input-icon">
                      <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                      <line x1="1" y1="1" x2="23" y2="23"></line>
                    </svg>
                  ) : (
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="input-icon">
                      <path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"></path>
                    </svg>
                  )}
                </button>
              </div>
              {errors.password && touched.password && (
                <span className="field-error">{errors.password}</span>
              )}
            </div>

            <button type="submit" className="login-button" disabled={loading}>
              {loading ? 'Signing in...' : 'Login'}
            </button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Login;
