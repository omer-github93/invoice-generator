import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { invoiceService } from '../../services/api';
import { generateInvoicePdf } from './InvoicePrint';
import './InvoiceList.css';

const InvoiceList = () => {
  const navigate = useNavigate();
  const [invoices, setInvoices] = useState([]);
  const [loading, setLoading] = useState(false);
  const [filters, setFilters] = useState({
    search: '',
    status: '',
    date_from: '',
    date_to: '',
  });
  const [pagination, setPagination] = useState({
    current_page: 1,
    per_page: 10,
    total: 0,
    last_page: 1,
  });
  useEffect(() => {
    loadInvoices();
  }, [pagination.current_page, pagination.per_page, filters.search, filters.status, filters.date_from, filters.date_to]);

  const loadInvoices = async () => {
    try {
      setLoading(true);
      const params = {
        page: pagination.current_page,
        per_page: pagination.per_page,
        ...filters,
      };
      
      // Remove empty filters
      Object.keys(params).forEach(key => {
        if (params[key] === '' || params[key] === null) {
          delete params[key];
        }
      });

      const response = await invoiceService.getInvoices(params);
      
      setInvoices(response.data);
      setPagination(prev => ({
        ...prev,
        total: response.total,
        current_page: response.current_page,
        last_page: response.last_page,
      }));
    } catch (error) {
      console.error('Error loading invoices:', error);
      alert('Failed to load invoices');
    } finally {
      setLoading(false);
    }
  };

  const handleFilterChange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({
      ...prev,
      [name]: value,
    }));
    setPagination(prev => ({
      ...prev,
      current_page: 1, // Reset to first page when filtering
    }));
  };

  const handlePageChange = (page) => {
    setPagination(prev => ({
      ...prev,
      current_page: page,
    }));
  };

  const handlePerPageChange = (e) => {
    setPagination(prev => ({
      ...prev,
      per_page: parseInt(e.target.value),
      current_page: 1,
    }));
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this invoice?')) {
      return;
    }

    try {
      await invoiceService.deleteInvoice(id);
      loadInvoices();
    } catch (error) {
      console.error('Error deleting invoice:', error);
      alert('Failed to delete invoice');
    }
  };

  const handleViewPdf = async (id) => {
    await generateInvoicePdf(id);
  };

  const formatDate = (dateString) => {
    if (!dateString) return '-';
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  };

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(amount);
  };

  const getStatusBadgeClass = (status) => {
    const statusClasses = {
      draft: 'status-draft',
      unpaid: 'status-unpaid',
      partially_paid: 'status-partially-paid',
      paid: 'status-paid',
    };
    return statusClasses[status] || 'status-draft';
  };

  return (
    <div className="invoice-list-container">
      {/* Beautiful Header */}
      <div className="list-header">
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
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                <polyline points="14 2 14 8 20 8"></polyline>
                <line x1="16" y1="13" x2="8" y2="13"></line>
                <line x1="16" y1="17" x2="8" y2="17"></line>
              </svg>
            </div>
            <h1>Invoices</h1>
          </div>
        </div>
        <button onClick={() => navigate('/invoices/new')} className="btn-create-invoice">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
            <line x1="12" y1="5" x2="12" y2="19"></line>
            <line x1="5" y1="12" x2="19" y2="12"></line>
          </svg>
          <span>Create Invoice</span>
        </button>
      </div>

      {/* Filters */}
      <div className="filters-section">
        <div className="filter-row">
          <div className="filter-group">
            <label>Search</label>
            <input
              type="text"
              name="search"
              value={filters.search}
              onChange={handleFilterChange}
              placeholder="Search by invoice number, client, or company..."
            />
          </div>
          <div className="filter-group">
            <label>Status</label>
            <select name="status" value={filters.status} onChange={handleFilterChange}>
              <option value="">All Statuses</option>
              <option value="draft">Draft</option>
              <option value="unpaid">Unpaid</option>
              <option value="partially_paid">Partially Paid</option>
              <option value="paid">Paid</option>
            </select>
          </div>
          <div className="filter-group">
            <label>Date From</label>
            <input
              type="date"
              name="date_from"
              value={filters.date_from}
              onChange={handleFilterChange}
            />
          </div>
          <div className="filter-group">
            <label>Date To</label>
            <input
              type="date"
              name="date_to"
              value={filters.date_to}
              onChange={handleFilterChange}
            />
          </div>
        </div>
      </div>

      {/* Table */}
      <div className="table-container">
        {loading ? (
          <div className="loading">Loading...</div>
        ) : (
          <table className="invoices-table">
            <thead>
              <tr>
                <th>Invoice Number</th>
                <th>Client</th>
                <th>Company</th>
                <th>Date</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Total</th>
                <th>Balance Due</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {invoices.length === 0 ? (
                <tr>
                  <td colSpan="9" className="no-data">
                    No invoices found
                  </td>
                </tr>
              ) : (
                invoices.map((invoice) => (
                  <tr key={invoice.id}>
                    <td>{invoice.invoice_number}</td>
                    <td>{invoice.client?.name || '-'}</td>
                    <td>{invoice.company?.name || '-'}</td>
                    <td>{formatDate(invoice.date)}</td>
                    <td>{formatDate(invoice.due_date)}</td>
                    <td>
                      <span className={`status-badge ${getStatusBadgeClass(invoice.status)}`}>
                        {invoice.status.replace('_', ' ')}
                      </span>
                    </td>
                    <td>{formatCurrency(invoice.total)}</td>
                    <td>{formatCurrency(invoice.balance_due)}</td>
                    <td>
                      <div className="action-buttons">
                        <button
                          onClick={() => navigate(`/invoices/${invoice.id}/edit`)}
                          className="btn-action btn-edit"
                          title="Edit"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleViewPdf(invoice.id)}
                          className="btn-action btn-view"
                          title="View PDF"
                        >
                          PDF
                        </button>
                        <button
                          onClick={() => handleDelete(invoice.id)}
                          className="btn-action btn-delete"
                          title="Delete"
                        >
                          Delete
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        )}
      </div>

      {/* Pagination */}
      <div className="pagination-section">
        <div className="pagination-info">
          <span>
            Showing {(pagination.current_page - 1) * pagination.per_page + 1} to{' '}
            {Math.min(pagination.current_page * pagination.per_page, pagination.total)} of{' '}
            {pagination.total} entries
          </span>
          <select value={pagination.per_page} onChange={handlePerPageChange}>
            <option value="10">10 per page</option>
            <option value="25">25 per page</option>
            <option value="50">50 per page</option>
            <option value="100">100 per page</option>
          </select>
        </div>
        <div className="pagination-buttons">
          <button
            onClick={() => handlePageChange(pagination.current_page - 1)}
            disabled={pagination.current_page === 1}
            className="btn-pagination"
          >
            Previous
          </button>
          <span className="page-numbers">
            {Array.from({ length: pagination.last_page }, (_, i) => i + 1)
              .filter(page => {
                // Show first page, last page, current page, and pages around current
                return (
                  page === 1 ||
                  page === pagination.last_page ||
                  Math.abs(page - pagination.current_page) <= 2
                );
              })
              .map((page, index, array) => {
                // Add ellipsis if there's a gap
                const prevPage = array[index - 1];
                if (prevPage && page - prevPage > 1) {
                  return (
                    <React.Fragment key={page}>
                      <span className="ellipsis">...</span>
                      <button
                        onClick={() => handlePageChange(page)}
                        className={`btn-pagination ${pagination.current_page === page ? 'active' : ''}`}
                      >
                        {page}
                      </button>
                    </React.Fragment>
                  );
                }
                return (
                  <button
                    key={page}
                    onClick={() => handlePageChange(page)}
                    className={`btn-pagination ${pagination.current_page === page ? 'active' : ''}`}
                  >
                    {page}
                  </button>
                );
              })}
          </span>
          <button
            onClick={() => handlePageChange(pagination.current_page + 1)}
            disabled={pagination.current_page === pagination.last_page}
            className="btn-pagination"
          >
            Next
          </button>
        </div>
      </div>
    </div>
  );
};

export default InvoiceList;

