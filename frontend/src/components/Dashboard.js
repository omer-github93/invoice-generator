import React, { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import { invoiceService } from '../services/api';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import './Dashboard.css';

const Dashboard = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [statistics, setStatistics] = useState(null);
  const [statsLoading, setStatsLoading] = useState(true);
  const [darkMode, setDarkMode] = useState(() => {
    const saved = localStorage.getItem('darkMode');
    return saved === 'true';
  });

  useEffect(() => {
    applyDarkMode(darkMode);
  }, [darkMode]);

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const data = await invoiceService.getStatistics();
        setStatistics(data);
      } catch (err) {
        console.error('Failed to load dashboard statistics:', err);
      } finally {
        setStatsLoading(false);
      }
    };
    fetchStats();
  }, []);

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(amount || 0);
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  };

  const applyDarkMode = (isDark) => {
    if (isDark) {
      document.documentElement.classList.add('dark-mode');
    } else {
      document.documentElement.classList.remove('dark-mode');
    }
  };

  const toggleDarkMode = () => {
    const newMode = !darkMode;
    setDarkMode(newMode);
    localStorage.setItem('darkMode', newMode.toString());
  };

  const handleLogout = async () => {
    await logout();
    navigate('/login');
  };

  return (
    <div className="dashboard-container">
      <nav className="dashboard-nav">
        <div className="nav-content">
          <div className="nav-brand">
            <svg className="nav-logo" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
              <polyline points="14 2 14 8 20 8"></polyline>
              <line x1="16" y1="13" x2="8" y2="13"></line>
              <line x1="16" y1="17" x2="8" y2="17"></line>
              <polyline points="10 9 9 9 8 9"></polyline>
            </svg>
            <h2>Invoice Generator</h2>
          </div>
          <div className="nav-right">
            {/* Dark Mode Toggle */}
            <button
              type="button"
              className={`dark-mode-toggle ${darkMode ? 'active' : ''}`}
              onClick={toggleDarkMode}
              title={darkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
            >
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                {darkMode ? (
                  <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                ) : (
                  <>
                    <circle cx="12" cy="12" r="5"></circle>
                    <line x1="12" y1="1" x2="12" y2="3"></line>
                    <line x1="12" y1="21" x2="12" y2="23"></line>
                    <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
                    <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
                    <line x1="1" y1="12" x2="3" y2="12"></line>
                    <line x1="21" y1="12" x2="23" y2="12"></line>
                    <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
                    <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
                  </>
                )}
              </svg>
            </button>
            <div className="user-profile">
              <div className="user-avatar">
                {user?.name?.charAt(0).toUpperCase()}
              </div>
              <div className="user-details">
                <span className="user-name">{user?.name}</span>
                <span className="user-role">Administrator</span>
              </div>
            </div>
            <button onClick={handleLogout} className="logout-button">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                <polyline points="16 17 21 12 16 7"></polyline>
                <line x1="21" y1="12" x2="9" y2="12"></line>
              </svg>
              <span>Logout</span>
            </button>
          </div>
        </div>
      </nav>

      <main className="dashboard-main">
        <div className="dashboard-content">
          <div className="dashboard-hero-section">
            <div className="dashboard-welcome-banner">
              <h1>Welcome back, {user?.name}!</h1>
              <p>Here is your current financial performance and invoice summaries.</p>
            </div>
            
            <div className="dashboard-stats-grid">
              {statsLoading ? (
                <div className="stats-skeleton-loader">
                  <div className="skeleton-card"></div>
                  <div className="skeleton-card"></div>
                  <div className="skeleton-card"></div>
                  <div className="skeleton-card"></div>
                </div>
              ) : (
                <>
                  <div className="stat-overview-card revenue">
                    <div className="stat-card-icon">
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <line x1="12" y1="1" x2="12" y2="23"></line>
                        <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                      </svg>
                    </div>
                    <div className="stat-card-data">
                      <span className="stat-title">Total Revenue</span>
                      <span className="stat-number">{formatCurrency(statistics?.financial?.revenue)}</span>
                    </div>
                  </div>

                  <div className="stat-overview-card profit">
                    <div className="stat-card-icon">
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M23 6l-9.5 9.5-5-5L1 18"></path>
                        <polyline points="17 6 23 6 23 12"></polyline>
                      </svg>
                    </div>
                    <div className="stat-card-data">
                      <span className="stat-title">Net Profit</span>
                      <span className="stat-number">{formatCurrency(statistics?.financial?.profit)}</span>
                    </div>
                  </div>

                  <div className="stat-overview-card expenses">
                    <div className="stat-card-icon">
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="8" y1="12" x2="16" y2="12"></line>
                      </svg>
                    </div>
                    <div className="stat-card-data">
                      <span className="stat-title">Total Expenses</span>
                      <span className="stat-number">{formatCurrency(statistics?.financial?.expenses)}</span>
                    </div>
                  </div>

                  <div className="stat-overview-card clients">
                    <div className="stat-card-icon">
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                      </svg>
                    </div>
                    <div className="stat-card-data">
                      <span className="stat-title">Active Clients</span>
                      <span className="stat-number">{statistics?.total_clients || 0}</span>
                    </div>
                  </div>
                </>
              )}
            </div>
          </div>

          {/* Analytics Section - Middle */}
          {!statsLoading && (
            <div className="dashboard-analytics-section">
              {/* Clients with Outstanding Invoices */}
              <div className="chart-card outstanding-clients-card">
                <div className="chart-header">
                  <h2>Clients with Outstanding Invoices</h2>
                  <p className="chart-subtitle">
                    {statistics?.clients_with_outstanding && Array.isArray(statistics.clients_with_outstanding) && statistics.clients_with_outstanding.length > 0
                      ? `${statistics.clients_with_outstanding.length} ${statistics.clients_with_outstanding.length === 1 ? 'client has' : 'clients have'} unpaid invoices`
                      : 'No clients with outstanding balances.'}
                  </p>
                </div>
                <div className="outstanding-clients-content">
                  {statistics?.clients_with_outstanding && Array.isArray(statistics.clients_with_outstanding) && statistics.clients_with_outstanding.length > 0 ? (
                    <div className="outstanding-clients-list">
                      {statistics.clients_with_outstanding.slice(0, 3).map((item) => (
                        <div key={item.client.id} className="outstanding-client-item">
                          <div className="client-info">
                            <div className="client-name-row">
                              <h3 className="client-name">{item.client.name}</h3>
                              <span className="outstanding-badge">
                                {item.invoice_count} {item.invoice_count === 1 ? 'Invoice' : 'Invoices'}
                              </span>
                            </div>
                            {item.company && (
                              <p className="company-name">{item.company.name}</p>
                            )}
                            <div className="client-contact">
                              {item.client.email && (
                                <span className="contact-item">
                                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                    <polyline points="22,6 12,13 2,6"></polyline>
                                  </svg>
                                  {item.client.email}
                                </span>
                              )}
                            </div>
                          </div>
                          <div className="outstanding-amount">
                            <span className="amount-label">Outstanding</span>
                            <span className="amount-value">{formatCurrency(item.total_outstanding)}</span>
                          </div>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <div className="no-outstanding">
                      <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                      </svg>
                      <p>All clear! No outstanding balances.</p>
                    </div>
                  )}
                </div>
              </div>

              {/* Financial Analysis by Year */}
              <div className="chart-card yearly-analysis-card">
                <div className="chart-header">
                  <h2>Financial Analysis by Year</h2>
                  <p className="chart-subtitle">Expenses, Revenue, and Profit by Year</p>
                </div>
                <div className="chart-content">
                  <ResponsiveContainer width="100%" height={260}>
                    <BarChart data={
                      statistics?.yearly_financial && Array.isArray(statistics.yearly_financial) && statistics.yearly_financial.length > 0
                        ? statistics.yearly_financial.map(yearData => ({
                            year: yearData.year,
                            Expenses: yearData.expenses,
                            Revenue: yearData.revenue,
                            Profit: yearData.profit,
                          }))
                        : [{
                            year: new Date().getFullYear().toString(),
                            Expenses: statistics?.financial?.expenses || 0,
                            Revenue: statistics?.financial?.revenue || 0,
                            Profit: statistics?.financial?.profit || 0,
                          }]
                    }>
                      <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                      <XAxis dataKey="year" stroke="#6b7280" />
                      <YAxis stroke="#6b7280" tickFormatter={(value) => formatCurrency(value)} />
                      <Tooltip formatter={(value) => formatCurrency(value)} />
                      <Legend />
                      <Bar dataKey="Expenses" fill="#ef4444" name="Expenses" />
                      <Bar dataKey="Revenue" fill="#2563eb" name="Revenue" />
                      <Bar dataKey="Profit" fill="#10b981" name="Profit" />
                    </BarChart>
                  </ResponsiveContainer>
                </div>
              </div>
            </div>
          )}

          {/* Menu Cards Section - Bottom */}
          {statsLoading ? (
            <div className="dashboard-cards skeleton-menu-grid">
              <div className="skeleton-menu-card"></div>
              <div className="skeleton-menu-card"></div>
              <div className="skeleton-menu-card"></div>
              <div className="skeleton-menu-card"></div>
            </div>
          ) : (
            <div className="dashboard-cards">
              <div className="dashboard-card card-invoice" onClick={() => navigate('/invoices')}>
                <div className="card-header">
                  <div className="card-icon-wrapper icon-invoice">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                      <polyline points="14 2 14 8 20 8"></polyline>
                      <line x1="16" y1="13" x2="8" y2="13"></line>
                      <line x1="16" y1="17" x2="8" y2="17"></line>
                    </svg>
                  </div>
                  <div className="card-arrow">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                  </div>
                </div>
                <h3>Invoices</h3>
                <p>Manage and create new invoices</p>
              </div>

              <div className="dashboard-card card-company" onClick={() => navigate('/companies')}>
                <div className="card-header">
                  <div className="card-icon-wrapper icon-company">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                      <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                  </div>
                  <div className="card-arrow">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                  </div>
                </div>
                <h3>Companies</h3>
                <p>Manage your companies</p>
              </div>

              <div className="dashboard-card card-client" onClick={() => navigate('/clients')}>
                <div className="card-header">
                  <div className="card-icon-wrapper icon-client">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                      <circle cx="9" cy="7" r="4"></circle>
                      <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                      <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                  </div>
                  <div className="card-arrow">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                  </div>
                </div>
                <h3>Clients</h3>
                <p>Manage your client database</p>
              </div>

              <div className="dashboard-card card-settings" onClick={() => navigate('/settings')}>
                <div className="card-header">
                  <div className="card-icon-wrapper icon-settings">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <circle cx="12" cy="12" r="3"></circle>
                      <path d="M12 1v6m0 6v6M5.64 5.64l4.24 4.24m4.24 4.24l4.24 4.24M1 12h6m6 0h6M5.64 18.36l4.24-4.24m4.24-4.24l4.24-4.24"></path>
                    </svg>
                  </div>
                  <div className="card-arrow">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                  </div>
                </div>
                <h3>Settings</h3>
                <p>Configure your company information and preferences</p>
              </div>
            </div>
          )}
        </div>
      </main>
    </div>
  );
};

export default Dashboard;

