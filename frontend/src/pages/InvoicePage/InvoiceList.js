import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { invoiceService } from '../../services/api';
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
    try {
      const invoice = await invoiceService.getInvoice(id);
      const company = invoice.company || {};
      const client = invoice.client || {};
      const companyLogo = company.logo_path 
        ? `${process.env.REACT_APP_API_URL || 'http://localhost:8000/api'}`.replace('/api', '') + `/storage/${company.logo_path}`
        : null;
      
      // Import the CSS content (we'll embed it inline)
      const printWindow = window.open('', '_blank');
      
      // Read CSS file content - we'll embed it inline
      const cssContent = `
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
          color: #333;
          background: #fff;
          line-height: 1.6;
        }
        .invoice-print-container {
          padding: 20px;
          background: #fff;
        }
        .invoice-container {
          max-width: 210mm;
          margin: 0 auto;
          padding: 40px;
          background: white;
        }
        .invoice-header {
          position: relative;
          display: flex;
          justify-content: space-between;
          align-items: flex-start;
          margin-bottom: 40px;
          overflow: hidden;
        }
        .header-left {
          background: linear-gradient(135deg, #1e3a5f 0%, #2c5282 100%);
          padding: 30px 40px;
          flex: 0 0 45%;
          position: relative;
          clip-path: polygon(0 0, 85% 0, 100% 100%, 0 100%);
        }
        .company-logo-section {
          display: flex;
          align-items: center;
          gap: 15px;
          margin-bottom: 10px;
        }
        .company-logo {
          width: 50px;
          height: 50px;
          background: #32cd32;
          border-radius: 8px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-weight: bold;
          font-size: 24px;
        }
        .company-logo img {
          width: 100%;
          height: 100%;
          object-fit: contain;
          border-radius: 8px;
        }
        .company-name {
          color: white;
          font-size: 24px;
          font-weight: bold;
          text-transform: uppercase;
          letter-spacing: 1px;
        }
        .company-tagline {
          color: rgba(255, 255, 255, 0.9);
          font-size: 12px;
          margin-top: 5px;
        }
        .header-right {
          flex: 1;
          padding: 30px 40px 30px 60px;
          position: relative;
        }
        .invoice-title {
          font-size: 72px;
          font-weight: bold;
          color: #32cd32;
          text-transform: uppercase;
          letter-spacing: 3px;
          margin-bottom: 15px;
          line-height: 1;
        }
        .invoice-details {
          color: #333;
          font-size: 14px;
        }
        .invoice-details p {
          margin: 5px 0;
        }
        .green-band {
          position: absolute;
          top: 0;
          right: 0;
          width: 200px;
          height: 100%;
          background: linear-gradient(135deg, #32cd32 0%, #28a745 100%);
          clip-path: polygon(15% 0, 100% 0, 100% 100%, 0 100%);
          z-index: -1;
        }
        .invoice-parties {
          display: flex;
          justify-content: space-between;
          margin-bottom: 40px;
          gap: 40px;
        }
        .party-section {
          flex: 1;
        }
        .party-label {
          color: #666;
          font-size: 12px;
          text-transform: uppercase;
          letter-spacing: 1px;
          margin-bottom: 10px;
        }
        .party-name {
          font-size: 18px;
          font-weight: bold;
          color: #333;
          margin-bottom: 8px;
        }
        .party-details {
          color: #666;
          font-size: 14px;
          line-height: 1.8;
        }
        .invoice-table {
          width: 100%;
          border-collapse: collapse;
          margin-bottom: 30px;
        }
        .invoice-table thead tr {
          background: transparent;
        }
        .invoice-table th {
          padding: 15px 12px;
          text-align: left;
          font-weight: 600;
          font-size: 12px;
          text-transform: uppercase;
          letter-spacing: 0.5px;
          color: white;
        }
        .invoice-table th.col-no {
          background: #32cd32;
          width: 60px;
        }
        .invoice-table th.col-desc {
          background: #32cd32;
        }
        .invoice-table th.col-price,
        .invoice-table th.col-qty,
        .invoice-table th.col-total {
          background: #1e3a5f;
          text-align: right;
        }
        .invoice-table tbody tr {
          border-bottom: 1px solid #f0f0f0;
        }
        .invoice-table tbody tr:nth-child(even) {
          background: #f9f9f9;
        }
        .invoice-table td {
          padding: 15px 12px;
          font-size: 14px;
          color: #333;
        }
        .invoice-table td.col-no {
          font-weight: 600;
          color: #666;
        }
        .invoice-table td.col-desc {
          color: #333;
        }
        .invoice-table td.col-desc .item-title {
          font-weight: 600;
          color: #333;
          margin-bottom: 5px;
        }
        .invoice-table td.col-price,
        .invoice-table td.col-qty,
        .invoice-table td.col-total {
          text-align: right;
          font-weight: 500;
        }
        .invoice-summary {
          display: flex;
          justify-content: flex-end;
          margin-bottom: 40px;
        }
        .summary-content {
          width: 300px;
        }
        .summary-row {
          display: flex;
          justify-content: space-between;
          padding: 10px 0;
          font-size: 14px;
          color: #666;
        }
        .summary-total {
          background: #32cd32;
          color: white;
          padding: 20px;
          border-radius: 8px;
          margin-top: 10px;
        }
        .summary-total .summary-row {
          color: white;
          font-size: 18px;
          font-weight: bold;
        }
        .invoice-footer-info {
          margin-bottom: 40px;
        }
        .footer-section {
          margin-bottom: 25px;
        }
        .footer-label {
          color: #32cd32;
          font-size: 14px;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 1px;
          margin-bottom: 10px;
        }
        .footer-content {
          color: #666;
          font-size: 14px;
          line-height: 1.8;
        }
        .payment-method {
          font-size: 18px;
          font-weight: bold;
          color: #333;
        }
        .invoice-contact-footer {
          background: #1e3a5f;
          color: white;
          padding: 25px 40px;
          display: flex;
          justify-content: space-between;
          align-items: center;
        }
        .contact-info {
          display: flex;
          gap: 30px;
          align-items: center;
        }
        .contact-item {
          display: flex;
          align-items: center;
          gap: 8px;
          font-size: 14px;
        }
        .contact-icon {
          width: 20px;
          height: 20px;
          background: #32cd32;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-size: 10px;
        }
        .footer-thanks {
          font-size: 16px;
          font-weight: bold;
          text-transform: uppercase;
          letter-spacing: 1px;
        }
        .print-button {
          position: fixed;
          top: 20px;
          right: 20px;
          padding: 12px 24px;
          background: #32cd32;
          color: white;
          border: none;
          border-radius: 6px;
          font-size: 14px;
          font-weight: 600;
          cursor: pointer;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
          z-index: 1000;
        }
        .print-button:hover {
          background: #28a745;
        }
        @media print {
          body { padding: 0; margin: 0; }
          .invoice-print-container { padding: 0; }
          .invoice-container { 
            max-width: 100%;
            padding: 30mm 25mm;
            margin: 0;
          }
          .print-button { display: none; }
          @page { margin: 0; size: A4; }
          .invoice-header { margin-bottom: 30px; }
          .invoice-parties { margin-bottom: 30px; }
          .invoice-table { margin-bottom: 25px; }
          .invoice-summary { margin-bottom: 30px; }
          .invoice-footer-info { margin-bottom: 30px; }
        }
      `;
      
      printWindow.document.write(`
        <!DOCTYPE html>
        <html>
          <head>
            <title>Invoice ${invoice.invoice_number}</title>
            <meta charset="UTF-8">
            <style>${cssContent}</style>
          </head>
          <body>
            <button class="print-button" onclick="window.print()">Print Invoice</button>
            <div class="invoice-print-container">
              <div class="invoice-container">
                <!-- Header -->
                <div class="invoice-header">
                  <div class="green-band"></div>
                  <div class="header-left">
                    <div class="company-logo-section">
                      <div class="company-logo">
                        ${companyLogo ? `<img src="${companyLogo}" alt="${company.name}" />` : (company.name ? company.name.charAt(0).toUpperCase() : 'C')}
                      </div>
                      <div>
                        <div class="company-name">${company.name || 'COMPANY'}</div>
                        <div class="company-tagline">COMPANY TAGLINE HERE</div>
                      </div>
                    </div>
                  </div>
                  <div class="header-right">
                    <div class="invoice-title">INVOICE</div>
                    <div class="invoice-details">
                      <p><strong>Invoice Number:</strong> ${invoice.invoice_number || 'N/A'}</p>
                      <p><strong>Invoice Date:</strong> ${formatDate(invoice.date)}</p>
                      ${invoice.due_date ? `<p><strong>Due Date:</strong> ${formatDate(invoice.due_date)}</p>` : ''}
                    </div>
                  </div>
                </div>
                
                <!-- Invoice To/From -->
                <div class="invoice-parties">
                  <div class="party-section">
                    <div class="party-label">Invoice To:</div>
                    <div class="party-name">${client.name || 'N/A'}</div>
                    <div class="party-details">
                      ${client.email ? `<div>Email: ${client.email}</div>` : ''}
                      ${client.phone ? `<div>Phone: ${client.phone}</div>` : ''}
                    </div>
                  </div>
                  <div class="party-section">
                    <div class="party-label">Invoice From:</div>
                    <div class="party-name">${company.name || 'N/A'}</div>
                    <div class="party-details">
                      ${company.address ? `<div>${company.address}</div>` : ''}
                    </div>
                  </div>
                </div>
                
                <!-- Items Table -->
                <table class="invoice-table">
                  <thead>
                    <tr>
                      <th class="col-no">NO.</th>
                      <th class="col-desc">PRODUCT DESCRIPTION</th>
                      <th class="col-price">PRICE</th>
                      <th class="col-qty">QTY.</th>
                      <th class="col-total">TOTAL</th>
                    </tr>
                  </thead>
                  <tbody>
                    ${invoice.items.map((item, index) => `
                      <tr>
                        <td class="col-no">${String(index + 1).padStart(2, '0')}</td>
                        <td class="col-desc">
                          <div class="item-title">${item.description || 'N/A'}</div>
                        </td>
                        <td class="col-price">${formatCurrency(item.unit_price)}</td>
                        <td class="col-qty">${item.quantity}</td>
                        <td class="col-total">${formatCurrency(item.line_total)}</td>
                      </tr>
                    `).join('')}
                  </tbody>
                </table>
                
                <!-- Summary -->
                <div class="invoice-summary">
                  <div class="summary-content">
                    <div class="summary-row">
                      <span>Subtotal:</span>
                      <span>${formatCurrency(invoice.subtotal)}</span>
                    </div>
                    <div class="summary-row">
                      <span>Tax (0%):</span>
                      <span>${formatCurrency(invoice.tax_amount || 0)}</span>
                    </div>
                    <div class="summary-total">
                      <div class="summary-row">
                        <span>Total:</span>
                        <span>${formatCurrency(invoice.total)}</span>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Payment Method & Terms -->
                <div class="invoice-footer-info">
                  <div class="footer-section">
                    <div class="footer-label">Payment Method:</div>
                    <div class="payment-method">${invoice.payment_terms || 'N/A'}</div>
                  </div>
                  ${invoice.note ? `
                  <div class="footer-section">
                    <div class="footer-label">Terms & Conditions:</div>
                    <div class="footer-content">${invoice.note}</div>
                  </div>
                  ` : ''}
                </div>
                
                <!-- Contact Footer -->
                <div class="invoice-contact-footer">
                  <div class="contact-info">
                    ${company.address ? `
                      <div class="contact-item">
                        <div class="contact-icon">📍</div>
                        <span>${company.address}</span>
                      </div>
                    ` : '<div class="contact-item"><div class="contact-icon">📍</div><span>Your location here</span></div>'}
                  </div>
                  <div class="footer-thanks">Thank You For Your Business</div>
                </div>
              </div>
            </div>
          </body>
        </html>
      `);
      printWindow.document.close();
    } catch (error) {
      console.error('Error loading PDF:', error);
      alert('Failed to load invoice');
    }
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

