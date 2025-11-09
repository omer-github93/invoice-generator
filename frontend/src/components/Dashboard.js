import React from 'react';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import './Dashboard.css';

const Dashboard = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = async () => {
    await logout();
    navigate('/login');
  };

  return (
    <div className="dashboard-container">
      <nav className="dashboard-nav">
        <div className="nav-content">
          <h2>Invoice Generator</h2>
          <div className="nav-right">
            <span className="user-name">{user?.name}</span>
            <button onClick={handleLogout} className="logout-button">
              Logout
            </button>
          </div>
        </div>
      </nav>

      <main className="dashboard-main">
        <div className="dashboard-content">
          <div className="welcome-section">
            <h1>Welcome to Dashboard, {user?.name}!</h1>
            <p>You have successfully logged in to the Invoice Generator system.</p>
          </div>

          <div className="dashboard-cards">
            <div className="dashboard-card" onClick={() => navigate('/invoices')} style={{ cursor: 'pointer' }}>
              <div className="card-icon">📄</div>
              <h3>Invoices</h3>
              <p>Manage and create new invoices</p>
            </div>

            <div className="dashboard-card" onClick={() => navigate('/companies')} style={{ cursor: 'pointer' }}>
              <div className="card-icon">🏢</div>
              <h3>Companies</h3>
              <p>Manage your companies</p>
            </div>

            <div className="dashboard-card" onClick={() => navigate('/clients')} style={{ cursor: 'pointer' }}>
              <div className="card-icon">👥</div>
              <h3>Clients</h3>
              <p>Manage your client database</p>
            </div>

            <div className="dashboard-card">
              <div className="card-icon">📊</div>
              <h3>Analytics</h3>
              <p>View your invoice analytics and reports</p>
            </div>
          </div>

          <div className="user-info">
            <h3>User Information</h3>
            <div className="info-grid">
              <div className="info-item">
                <span className="info-label">Name:</span>
                <span className="info-value">{user?.name}</span>
              </div>
              <div className="info-item">
                <span className="info-label">Email:</span>
                <span className="info-value">{user?.email}</span>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;

