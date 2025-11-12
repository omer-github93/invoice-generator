import React from 'react';
import './InvoicePrint.css';

const InvoicePrint = ({ invoice }) => {
  const company = invoice?.company || {};
  const client = invoice?.client || {};
  const companyLogo = company.logo_path 
    ? `${process.env.REACT_APP_API_URL || 'http://localhost:8000/api'}`.replace('/api', '') + `/storage/${company.logo_path}`
    : null;
  
  const formatDate = (dateString) => {
    if (!dateString) return '-';
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  };

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(amount || 0);
  };

  return (
    <div className="invoice-print-container">
      <button className="print-button" onClick={() => window.print()}>Print Invoice</button>
      <div className="invoice-container">
        {/* Header */}
        <div className="invoice-header">
          <div className="green-band"></div>
          <div className="header-left">
            <div className="company-logo-section">
              <div className="company-logo">
                {companyLogo ? (
                  <img src={companyLogo} alt={company.name} />
                ) : (
                  company.name ? company.name.charAt(0).toUpperCase() : 'C'
                )}
              </div>
              <div>
                <div className="company-name">{company.name || 'COMPANY'}</div>
                <div className="company-tagline">COMPANY TAGLINE HERE</div>
              </div>
            </div>
          </div>
          <div className="header-right">
            <div className="invoice-title">INVOICE</div>
            <div className="invoice-details">
              <p><strong>Invoice Number:</strong> {invoice?.invoice_number || 'N/A'}</p>
              <p><strong>Invoice Date:</strong> {formatDate(invoice?.date)}</p>
              {invoice?.due_date && (
                <p><strong>Due Date:</strong> {formatDate(invoice.due_date)}</p>
              )}
            </div>
          </div>
        </div>
        
        {/* Invoice To/From */}
        <div className="invoice-parties">
          <div className="party-section">
            <div className="party-label">Invoice To:</div>
            <div className="party-name">{client.name || 'N/A'}</div>
            <div className="party-details">
              {client.email && <div>Email: {client.email}</div>}
              {client.phone && <div>Phone: {client.phone}</div>}
            </div>
          </div>
          <div className="party-section">
            <div className="party-label">Invoice From:</div>
            <div className="party-name">{company.name || 'N/A'}</div>
            <div className="party-details">
              {company.address && <div>{company.address}</div>}
            </div>
          </div>
        </div>
        
        {/* Items Table */}
        <table className="invoice-table">
          <thead>
            <tr>
              <th className="col-no">NO.</th>
              <th className="col-desc">PRODUCT DESCRIPTION</th>
              <th className="col-price">PRICE</th>
              <th className="col-qty">QTY.</th>
              <th className="col-total">TOTAL</th>
            </tr>
          </thead>
          <tbody>
            {invoice?.items?.map((item, index) => (
              <tr key={index}>
                <td className="col-no">{String(index + 1).padStart(2, '0')}</td>
                <td className="col-desc">
                  <div className="item-title">{item.description || 'N/A'}</div>
                </td>
                <td className="col-price">{formatCurrency(item.unit_price)}</td>
                <td className="col-qty">{item.quantity}</td>
                <td className="col-total">{formatCurrency(item.line_total)}</td>
              </tr>
            ))}
          </tbody>
        </table>
        
        {/* Summary */}
        <div className="invoice-summary">
          <div className="summary-content">
            <div className="summary-row">
              <span>Subtotal:</span>
              <span>{formatCurrency(invoice?.subtotal)}</span>
            </div>
            <div className="summary-row">
              <span>Tax (0%):</span>
              <span>{formatCurrency(invoice?.tax_amount || 0)}</span>
            </div>
            <div className="summary-total">
              <div className="summary-row">
                <span>Total:</span>
                <span>{formatCurrency(invoice?.total)}</span>
              </div>
            </div>
          </div>
        </div>
        
        {/* Payment Method & Terms */}
        <div className="invoice-footer-info">
          <div className="footer-section">
            <div className="footer-label">Payment Method:</div>
            <div className="payment-method">{invoice?.payment_terms || 'N/A'}</div>
          </div>
          {invoice?.note && (
            <div className="footer-section">
              <div className="footer-label">Terms & Conditions:</div>
              <div className="footer-content">{invoice.note}</div>
            </div>
          )}
        </div>
        
        {/* Contact Footer */}
        <div className="invoice-contact-footer">
          <div className="contact-info">
            {company.address ? (
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <span>{company.address}</span>
              </div>
            ) : (
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <span>Your location here</span>
              </div>
            )}
          </div>
          <div className="footer-thanks">Thank You For Your Business</div>
        </div>
      </div>
    </div>
  );
};

export default InvoicePrint;

