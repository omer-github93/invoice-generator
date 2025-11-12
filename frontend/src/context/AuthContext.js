import React, { createContext, useContext, useState, useEffect } from 'react';
import { authService } from '../services/api';

const AuthContext = createContext(null);

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const initAuth = async () => {
      try {
        const token = localStorage.getItem('token');
        const storedUser = localStorage.getItem('user');
        
        if (token && storedUser) {
          try {
            // Set user from localStorage immediately for faster UI
            setUser(JSON.parse(storedUser));
            
            // Verify token is still valid
            const data = await authService.getMe();
            setUser(data.user);
            localStorage.setItem('user', JSON.stringify(data.user));
          } catch (error) {
            // Token is invalid, clear everything
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            setUser(null);
          }
        } else {
          // No token or user, ensure user is null
          setUser(null);
        }
      } catch (error) {
        console.error('Auth initialization error:', error);
        setUser(null);
        localStorage.removeItem('token');
        localStorage.removeItem('user');
      } finally {
        // Always set loading to false, regardless of success or failure
        setLoading(false);
      }
    };

    initAuth();
  }, []);

  const login = async (username, password) => {
    try {
      const data = await authService.login(username, password);
      setUser(data.user);
      return { success: true };
    } catch (error) {
      const errorMessage = error.response?.data?.errors?.username?.[0] 
        || error.response?.data?.message 
        || 'Login failed. Please check your credentials.';
      return {
        success: false,
        error: errorMessage,
      };
    }
  };

  const logout = async () => {
    await authService.logout();
    setUser(null);
  };

  const value = {
    user,
    loading,
    login,
    logout,
    isAuthenticated: !!user,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

