import React from 'react';
import { invoiceService, settingService } from '../../services/api';
import './InvoicePrint.css';

// Utility functions
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

// Function to generate and print PDF
export const generateInvoicePdf = async (invoiceId) => {
  try {
    const [invoice, settings] = await Promise.all([
      invoiceService.getInvoice(invoiceId),
      settingService.getSettings()
    ]);
    const company = invoice.company || {};
    const client = invoice.client || {};
    
    // Use settings logo, or fallback to company logo
    const apiUrl = (process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '');
    const settingsLogo = settings.logo 
      ? `${apiUrl}/storage/${settings.logo}`
      : null;
    const companyLogo = company.logo_path 
      ? `${apiUrl}/storage/${company.logo_path}`
      : null;
    const logoToUse = settingsLogo || companyLogo;
    
    // Create a hidden iframe for printing
    const iframe = document.createElement('iframe');
    iframe.style.position = 'fixed';
    iframe.style.right = '0';
    iframe.style.bottom = '0';
    iframe.style.width = '0';
    iframe.style.height = '0';
    iframe.style.border = '0';
    document.body.appendChild(iframe);
    
    const printWindow = iframe.contentWindow;
    
    // Get CSS content from the CSS file (we'll embed it inline)
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
        position: relative;
        overflow: hidden;
      }
      .status-ribbon {
        position: absolute;
        top: 20px;
        right: -35px;
        width: 150px;
        padding: 8px 0;
        text-align: center;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        color: white;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        transform: rotate(45deg);
        z-index: 10;
      }
      .status-ribbon.paid {
        background: linear-gradient(135deg, #32cd32 0%, #28a745 100%);
      }
      .status-ribbon.unpaid {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);
      }
      .status-ribbon.partially-paid {
        background: linear-gradient(135deg, #ffa726 0%, #fb8c00 100%);
      }
      .status-ribbon.draft {
        background: linear-gradient(135deg, #9e9e9e 0%, #757575 100%);
      }
      .invoice-header {
        position: relative;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 35px;
        padding-bottom: 20px;
        border-bottom: 3px solid #32cd32;
      }
      .header-left {
        flex: 0 0 auto;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }
      .company-logo-section {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
      }
      .company-logo {
        width: 80px;
        height: 80px;
        background: transparent;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        margin-bottom: 5px;
      }
      .company-logo img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        border-radius: 8px;
      }
      .company-tagline {
        color: #666;
        font-size: 13px;
        font-weight: 500;
        letter-spacing: 0.5px;
        margin-top: 0;
        max-width: 200px;
        line-height: 1.4;
      }
      .header-right {
        flex: 1;
        text-align: right;
        padding-left: 40px;
      }
      .invoice-title {
        font-size: 64px;
        font-weight: 900;
        color: #32cd32;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-bottom: 12px;
        line-height: 1;
        word-spacing: 0;
      }
      .invoice-details {
        color: #333;
        font-size: 13px;
        text-align: right;
      }
      .invoice-details p {
        margin: 4px 0;
        line-height: 1.5;
      }
      .invoice-parties {
        display: flex;
        justify-content: space-between;
        margin-bottom: 25px;
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
        margin-bottom: 20px;
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
        margin-bottom: 20px;
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
        margin-bottom: 15px;
      }
      .footer-section {
        margin-bottom: 12px;
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
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 15px;
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
      @media print {
        body { padding: 0; margin: 0; }
        .invoice-print-container { padding: 0; }
        .invoice-container { 
          max-width: 100%;
          padding: 20mm 25mm;
          margin: 0;
          page-break-inside: avoid;
        }
        .print-button { display: none; }
        @page { margin: 0; size: A4; }
        .invoice-header { margin-bottom: 20px; padding-bottom: 15px; }
        .invoice-parties { margin-bottom: 18px; }
        .invoice-table { margin-bottom: 15px; }
        .invoice-summary { margin-bottom: 15px; }
        .invoice-footer-info { margin-bottom: 12px; }
        .invoice-contact-footer { margin-top: 10px; padding: 12px 25px; }
        .footer-section { margin-bottom: 8px; }
      }
    `;
    
    printWindow.document.open();
    printWindow.document.write(`
      <!DOCTYPE html>
      <html>
        <head>
          <title>Invoice ${invoice.invoice_number}</title>
          <meta charset="UTF-8">
          <style>${cssContent}</style>
        </head>
          <body>
            <div class="invoice-print-container">
              <div class="invoice-container">
                <!-- Status Ribbon -->
                <div class="status-ribbon ${invoice.status === 'paid' ? 'paid' : invoice.status === 'partially_paid' ? 'partially-paid' : invoice.status === 'draft' ? 'draft' : 'unpaid'}">
                  ${invoice.status === 'paid' ? 'PAID' : invoice.status === 'partially_paid' ? 'PARTIALLY PAID' : invoice.status === 'draft' ? 'DRAFT' : 'UNPAID'}
                </div>
                <!-- Header -->
              <div class="invoice-header">
                <div class="header-left">
                  <div class="company-logo-section">
                    <div class="company-logo">
                      ${logoToUse ? `<img src="${logoToUse}" alt="${settings.name || company.name}" />` : `<div style="width: 80px; height: 80px; background: #32cd32; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 32px;">${(settings.name || company.name) ? (settings.name || company.name).charAt(0).toUpperCase() : 'C'}</div>`}
                    </div>
                    ${settings.logo_tagline ? `<div class="company-tagline">${settings.logo_tagline}</div>` : ''}
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
                  <div class="party-name">${settings.name || company.name || 'N/A'}</div>
                  <div class="party-details">
                    ${settings.email ? `<div>Email: ${settings.email}</div>` : ''}
                    ${settings.phone ? `<div>Phone: ${settings.phone}</div>` : ''}
                    ${settings.address ? `<div>${settings.address}</div>` : (company.address ? `<div>${company.address}</div>` : '')}
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
                ${settings.privacy_and_policy ? `
                <div class="footer-section">
                  <div class="footer-label">Privacy & Policy:</div>
                  <div class="footer-content">${settings.privacy_and_policy}</div>
                </div>
                ` : ''}
              </div>
              
              <!-- Contact Footer -->
              <div class="invoice-contact-footer">
                <div class="contact-info">
                  ${settings.address ? `
                    <div class="contact-item">
                      <div class="contact-icon">📍</div>
                      <span>${settings.address}</span>
                    </div>
                  ` : (company.address ? `
                    <div class="contact-item">
                      <div class="contact-icon">📍</div>
                      <span>${company.address}</span>
                    </div>
                  ` : '<div class="contact-item"><div class="contact-icon">📍</div><span>Your location here</span></div>')}
                </div>
                <div class="footer-thanks">Thank You For Your Business</div>
              </div>
            </div>
          </div>
        </body>
      </html>
    `);
    printWindow.document.close();
    
    // Wait for content to load, then print
    setTimeout(() => {
      printWindow.print();
      // Remove iframe after printing
      setTimeout(() => {
        document.body.removeChild(iframe);
      }, 100);
    }, 500);
  } catch (error) {
    console.error('Error loading PDF:', error);
    alert('Failed to load invoice');
  }
};

// React component for viewing invoice (if needed in future)
const InvoicePrint = ({ invoice, settings }) => {
  const company = invoice?.company || {};
  const client = invoice?.client || {};
  
  const apiUrl = (process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '');
  const settingsLogo = settings?.logo 
    ? `${apiUrl}/storage/${settings.logo}`
    : null;
  const companyLogo = company?.logo_path 
    ? `${apiUrl}/storage/${company.logo_path}`
    : null;
  const logoToUse = settingsLogo || companyLogo;

  return (
    <div className="invoice-print-container">
      <button className="print-button" onClick={() => window.print()}>Print Invoice</button>
      <div className="invoice-container">
        {/* Status Ribbon */}
        <div className={`status-ribbon ${invoice?.status === 'paid' ? 'paid' : invoice?.status === 'partially_paid' ? 'partially-paid' : invoice?.status === 'draft' ? 'draft' : 'unpaid'}`}>
          {invoice?.status === 'paid' ? 'PAID' : invoice?.status === 'partially_paid' ? 'PARTIALLY PAID' : invoice?.status === 'draft' ? 'DRAFT' : 'UNPAID'}
        </div>
        {/* Header */}
        <div className="invoice-header">
          <div className="header-left">
            <div className="company-logo-section">
              <div className="company-logo">
                {logoToUse ? (
                  <img src={logoToUse} alt={settings?.name || company?.name} />
                ) : (
                  <div style={{width: '80px', height: '80px', background: '#32cd32', borderRadius: '8px', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'white', fontWeight: 'bold', fontSize: '32px'}}>
                    {(settings?.name || company?.name) ? (settings?.name || company?.name).charAt(0).toUpperCase() : 'C'}
                  </div>
                )}
              </div>
              {settings?.logo_tagline && <div className="company-tagline">{settings.logo_tagline}</div>}
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
            <div className="party-name">{client?.name || 'N/A'}</div>
            <div className="party-details">
              {client?.email && <div>Email: {client.email}</div>}
              {client?.phone && <div>Phone: {client.phone}</div>}
            </div>
          </div>
          <div className="party-section">
            <div className="party-label">Invoice From:</div>
            <div className="party-name">{settings?.name || company?.name || 'N/A'}</div>
            <div className="party-details">
              {settings?.email && <div>Email: {settings.email}</div>}
              {settings?.phone && <div>Phone: {settings.phone}</div>}
              {settings?.address ? <div>{settings.address}</div> : (company?.address ? <div>{company.address}</div> : null)}
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
          {settings?.privacy_and_policy && (
            <div className="footer-section">
              <div className="footer-label">Privacy & Policy:</div>
              <div className="footer-content">{settings.privacy_and_policy}</div>
            </div>
          )}
        </div>
        
        {/* Contact Footer */}
        <div className="invoice-contact-footer">
          <div className="contact-info">
            {settings?.address ? (
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <span>{settings.address}</span>
              </div>
            ) : (company?.address ? (
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <span>{company.address}</span>
              </div>
            ) : (
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <span>Your location here</span>
              </div>
            ))}
          </div>
          <div className="footer-thanks">Thank You For Your Business</div>
        </div>
      </div>
    </div>
  );
};

export default InvoicePrint;
