import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { invoiceService } from '../../services/api';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import './AnalyticsDashboard.css';

const AnalyticsDashboard = () => {
  const navigate = useNavigate();
  const [statistics, setStatistics] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadStatistics();
  }, []);

  const loadStatistics = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await invoiceService.getStatistics();
      setStatistics(data);
    } catch (err) {
      console.error('Error loading statistics:', err);
      setError('Failed to load statistics');
    } finally {
      setLoading(false);
    }
  };

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(amount || 0);
  };

  if (loading) {
    return (
      <div className="analytics-container">
        <div className="analytics-loading">
          <div className="loading-spinner"></div>
          <p>Loading analytics...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="analytics-container">
        <div className="analytics-error">
          <p>{error}</p>
          <button onClick={loadStatistics} className="retry-button">Retry</button>
        </div>
      </div>
    );
  }

  if (!statistics) {
    return null;
  }

  // Prepare bar chart data by year
  // Expenses = Cost Price (what you paid from your pocket)
  // Revenue = Total Unit Price (what you sell to clients)
  // Profit = Revenue - Expenses
  const barData = statistics.yearly_financial && Array.isArray(statistics.yearly_financial) && statistics.yearly_financial.length > 0
    ? statistics.yearly_financial.map(yearData => ({
        year: yearData.year,
        Expenses: yearData.expenses,
        Revenue: yearData.revenue,
        Profit: yearData.profit,
      }))
    : [
        {
          year: new Date().getFullYear().toString(),
          Expenses: statistics.financial.expenses,
          Revenue: statistics.financial.revenue,
          Profit: statistics.financial.profit,
        },
      ];

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  };

  return (
    <div className="analytics-container">
      {/* Header */}
      <div className="analytics-page-header">
        <div className="header-left">
          <button onClick={() => navigate('/dashboard')} className="back-button">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            <span>Back to Dashboard</span>
          </button>
          <div className="header-title-section">
            <div className="header-icon-wrapper">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <line x1="18" y1="20" x2="18" y2="10"></line>
                <line x1="12" y1="20" x2="12" y2="4"></line>
                <line x1="6" y1="20" x2="6" y2="14"></line>
              </svg>
            </div>
            <h1>Analytics Dashboard</h1>
          </div>
        </div>
      </div>

      <div className="analytics-header">
        <p className="analytics-subtitle">Key metrics and insights for your business</p>
      </div>

      {/* Summary Cards */}
      <div className="summary-cards">
        <div className="summary-card card-clients">
          <div className="card-icon">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
              <circle cx="9" cy="7" r="4"></circle>
              <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
              <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>
          </div>
          <div className="card-content">
            <h3>Total Clients</h3>
            <p className="card-value">{statistics.total_clients}</p>
          </div>
        </div>

        <div className="summary-card card-unpaid">
          <div className="card-icon">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
              <polyline points="14 2 14 8 20 8"></polyline>
              <line x1="16" y1="13" x2="8" y2="13"></line>
              <line x1="16" y1="17" x2="8" y2="17"></line>
            </svg>
          </div>
          <div className="card-content">
            <h3>Unpaid Invoices</h3>
            <p className="card-value">{statistics.total_unpaid_invoices}</p>
          </div>
        </div>

        <div className="summary-card card-revenue">
          <div className="card-icon">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <line x1="12" y1="1" x2="12" y2="23"></line>
              <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
            </svg>
          </div>
          <div className="card-content">
            <h3>Total Revenue</h3>
            <p className="card-value">{formatCurrency(statistics.financial.revenue)}</p>
          </div>
        </div>

        <div className="summary-card card-profit">
          <div className="card-icon">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
            </svg>
          </div>
          <div className="card-content">
            <h3>Total Profit</h3>
            <p className="card-value">{formatCurrency(statistics.financial.profit)}</p>
          </div>
        </div>
      </div>

      {/* Charts Section */}
      <div className="charts-section">
        {/* Clients with Outstanding Invoices */}
        <div className="chart-card outstanding-clients-card">
          <div className="chart-header">
            <h2>Clients with Outstanding Invoices</h2>
            <p className="chart-subtitle">
              {statistics.clients_with_outstanding && Array.isArray(statistics.clients_with_outstanding) && statistics.clients_with_outstanding.length > 0
                ? `${statistics.clients_with_outstanding.length} ${statistics.clients_with_outstanding.length === 1 ? 'client has' : 'clients have'} unpaid invoices`
                : 'Clients who need to pay their invoices'}
            </p>
          </div>
          <div className="outstanding-clients-content">
            {statistics.clients_with_outstanding && Array.isArray(statistics.clients_with_outstanding) && statistics.clients_with_outstanding.length > 0 ? (
              <div className="outstanding-clients-list">
                {statistics.clients_with_outstanding.map((item, index) => (
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
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                              <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                              <polyline points="22,6 12,13 2,6"></polyline>
                            </svg>
                            {item.client.email}
                          </span>
                        )}
                        {item.client.phone && (
                          <span className="contact-item">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                              <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                            </svg>
                            {item.client.phone}
                          </span>
                        )}
                      </div>
                    </div>
                    <div className="outstanding-amount">
                      <span className="amount-label">Total Outstanding</span>
                      <span className="amount-value">{formatCurrency(item.total_outstanding)}</span>
                    </div>
                    <div className="invoices-list">
                      {item.invoices.map((invoice, invIndex) => (
                        <div key={invIndex} className="invoice-item">
                          <div className="invoice-number">{invoice.invoice_number}</div>
                          <div className="invoice-details">
                            <span className="invoice-amount">{formatCurrency(invoice.balance_due)}</span>
                            {invoice.due_date && (
                              <span className={`due-date ${new Date(invoice.due_date) < new Date() ? 'overdue' : ''}`}>
                                Due: {formatDate(invoice.due_date)}
                              </span>
                            )}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="no-outstanding">
                <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                  <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                  <polyline points="22 4 12 14.01 9 11.01"></polyline>
                </svg>
                <p>All invoices have been paid. No clients with outstanding balances.</p>
              </div>
            )}
          </div>
        </div>

        {/* Bar Chart */}
        <div className="chart-card">
          <div className="chart-header">
            <h2>Financial Analysis by Year</h2>
            <p className="chart-subtitle">Expenses (Cost Price), Revenue (What You Sell), and Profit by Year</p>
          </div>
          <div className="chart-content">
            <ResponsiveContainer width="100%" height={300}>
              <BarChart data={barData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="year" stroke="#6b7280" />
                <YAxis stroke="#6b7280" tickFormatter={(value) => formatCurrency(value)} />
                <Tooltip formatter={(value) => formatCurrency(value)} />
                <Legend />
                <Bar dataKey="Expenses" fill="#ef4444" name="Expenses (Cost Price)" />
                <Bar dataKey="Revenue" fill="#2563eb" name="Revenue (What You Sell)" />
                <Bar dataKey="Profit" fill="#10b981" name="Profit" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AnalyticsDashboard;

