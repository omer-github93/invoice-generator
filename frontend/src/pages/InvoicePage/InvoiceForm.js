import React, { useState, useEffect, useRef } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { invoiceService, companyService, clientService } from '../../services/api';
import './InvoiceForm.css';

const InvoiceForm = () => {
  const params = useParams();
  const navigate = useNavigate();
  const id = params.id;
  const isEdit = !!id;

  const [loading, setLoading] = useState(false);
  const [loadingCompanies, setLoadingCompanies] = useState(false);
  const [companies, setCompanies] = useState([]);
  const [clients, setClients] = useState([]);
  const [formData, setFormData] = useState({
    invoice_number: '',
    company_id: '',
    client_id: '',
    date: new Date().toISOString().split('T')[0],
    due_date: '',
    payment_terms: 'cash',
    status: 'draft',
    balance_due: '',
    note: '',
    items: [{ description: '', quantity: 1, cost_price: 0, unit_price: 0 }],
    attachments: null,
  });

  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});
  const [companyLogo, setCompanyLogo] = useState(null);
  
  // Refs for required fields
  const clientIdRef = useRef(null);
  const companyIdRef = useRef(null);
  const dateRef = useRef(null);
  const paymentTermsRef = useRef(null);
  const statusRef = useRef(null);
  const itemsDescriptionRefs = useRef([]);

  useEffect(() => {
    loadAllClients();
    if (isEdit) {
      loadInvoice();
    }
  }, [id]);

  useEffect(() => {
    if (formData.client_id) {
      loadCompaniesForClient(formData.client_id);
    } else {
      setCompanies([]);
    }
  }, [formData.client_id]);

  useEffect(() => {
    if (formData.company_id) {
      // Load company logo
      const company = companies.find(c => c.id === parseInt(formData.company_id));
      if (company && company.logo_path) {
        setCompanyLogo(company.logo_path);
      }
    }
  }, [formData.company_id, companies]);

  const loadCompaniesForClient = async (clientId) => {
    try {
      setLoadingCompanies(true);
      const data = await clientService.getCompaniesByClient(clientId);
      // Handle both array and object with data property
      const companiesList = Array.isArray(data) ? data : (data.data || data.companies || []);
      setCompanies(companiesList);
      // If editing and company_id is set, make sure it's still in the list
      if (formData.company_id && companiesList.length > 0 && !companiesList.find(c => c.id === parseInt(formData.company_id))) {
        // Company not found in client's companies, clear it
        setFormData(prev => ({ ...prev, company_id: '' }));
      }
    } catch (error) {
      console.error('Error loading companies for client:', error);
      setCompanies([]);
    } finally {
      setLoadingCompanies(false);
    }
  };

  const loadAllClients = async () => {
    try {
      const response = await clientService.getClients({ per_page: 1000 });
      setClients(Array.isArray(response.data) ? response.data : response);
    } catch (error) {
      console.error('Error loading clients:', error);
    }
  };

  const loadInvoice = async () => {
    try {
      setLoading(true);
      const invoice = await invoiceService.getInvoice(id);
      setFormData({
        invoice_number: invoice.invoice_number,
        company_id: invoice.company_id,
        client_id: invoice.client_id,
        date: invoice.date || new Date().toISOString().split('T')[0],
        due_date: invoice.due_date || '',
        payment_terms: invoice.payment_terms || 'cash',
        status: invoice.status,
        balance_due: invoice.balance_due || '',
        note: invoice.note || '',
        items: invoice.items.map(item => ({
          description: item.description,
          quantity: item.quantity,
          cost_price: item.cost_price || 0,
          unit_price: item.unit_price,
        })),
        attachments: null,
      });
      
      // Load companies for the client
      if (invoice.client_id) {
        await loadCompaniesForClient(invoice.client_id);
      }
      
      if (invoice.company?.logo_path) {
        setCompanyLogo(invoice.company.logo_path);
      }
    } catch (error) {
      console.error('Error loading invoice:', error);
      alert('Failed to load invoice');
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value,
    }));
    // Clear errors for this field
    if (errors[name]) {
      setErrors(prev => {
        const newErrors = { ...prev };
        delete newErrors[name];
        return newErrors;
      });
    }
  };

  const handleItemChange = (index, field, value) => {
    const newItems = [...formData.items];
    newItems[index][field] = value;
    
    // Calculate line total
    if (field === 'quantity' || field === 'unit_price') {
      const quantity = parseFloat(newItems[index].quantity) || 0;
      const unitPrice = parseFloat(newItems[index].unit_price) || 0;
      newItems[index].line_total = quantity * unitPrice;
    }
    
    setFormData(prev => ({
      ...prev,
      items: newItems,
    }));
  };

  const addItem = () => {
    setFormData(prev => ({
      ...prev,
      items: [...prev.items, { description: '', quantity: 1, cost_price: 0, unit_price: 0 }],
    }));
  };

  const removeItem = (index) => {
    if (formData.items.length > 1) {
      setFormData(prev => ({
        ...prev,
        items: prev.items.filter((_, i) => i !== index),
      }));
    }
  };

  const handleFileChange = (e) => {
    setFormData(prev => ({
      ...prev,
      attachments: e.target.files,
    }));
  };

  const calculateTotals = () => {
    const subtotal = formData.items.reduce((sum, item) => {
      const qty = parseFloat(item.quantity) || 0;
      const price = parseFloat(item.unit_price) || 0;
      return sum + (qty * price);
    }, 0);
    const tax = 0; // 0% tax
    const total = subtotal + tax;
    return { subtotal, tax, total };
  };

  const scrollToFirstError = (errors) => {
    // Priority order: client_id, company_id, date, payment_terms, status, then items
    if (errors.client_id) {
      clientIdRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => clientIdRef.current?.focus(), 300);
      return;
    }
    
    if (errors.company_id) {
      companyIdRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => companyIdRef.current?.focus(), 300);
      return;
    }
    
    if (errors.date) {
      dateRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => dateRef.current?.focus(), 300);
      return;
    }
    
    if (errors.payment_terms) {
      paymentTermsRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => paymentTermsRef.current?.focus(), 300);
      return;
    }
    
    if (errors.status) {
      statusRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => statusRef.current?.focus(), 300);
      return;
    }
    
    // Check for item errors
    for (let index = 0; index < formData.items.length; index++) {
      if (errors[`items.${index}.description`]) {
        const ref = itemsDescriptionRefs.current[index];
        if (ref) {
          ref.scrollIntoView({ behavior: 'smooth', block: 'center' });
          setTimeout(() => ref.focus(), 300);
          return;
        }
      }
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    // Client-side validation
    const clientErrors = {};
    let hasErrors = false;
    
    if (!formData.client_id) {
      clientErrors.client_id = ['The client field is required.'];
      hasErrors = true;
    }
    
    if (!formData.company_id) {
      clientErrors.company_id = ['The company field is required.'];
      hasErrors = true;
    }
    
    if (!formData.date) {
      clientErrors.date = ['The date field is required.'];
      hasErrors = true;
    }
    
    if (!formData.payment_terms) {
      clientErrors.payment_terms = ['The payment terms field is required.'];
      hasErrors = true;
    }
    
    if (!formData.status) {
      clientErrors.status = ['The status field is required.'];
      hasErrors = true;
    }
    
    // Validate items
    formData.items.forEach((item, index) => {
      if (!item.description || item.description.trim() === '') {
        clientErrors[`items.${index}.description`] = ['The description field is required.'];
        hasErrors = true;
      }
      if (!item.quantity || parseFloat(item.quantity) <= 0) {
        clientErrors[`items.${index}.quantity`] = ['The quantity must be greater than 0.'];
        hasErrors = true;
      }
      if (!item.unit_price || parseFloat(item.unit_price) < 0) {
        clientErrors[`items.${index}.unit_price`] = ['The unit price must be greater than or equal to 0.'];
        hasErrors = true;
      }
    });
    
    // Mark only required fields as touched when submitting
    const requiredFields = ['client_id', 'company_id', 'date', 'payment_terms', 'status'];
    const touchedFields = {};
    requiredFields.forEach(field => {
      touchedFields[field] = true;
    });
    formData.items.forEach((item, index) => {
      touchedFields[`items.${index}.description`] = true;
      touchedFields[`items.${index}.quantity`] = true;
      touchedFields[`items.${index}.unit_price`] = true;
    });
    setTouched(touchedFields);
    
    // If client-side validation fails, set errors and scroll
    if (hasErrors) {
      setErrors(clientErrors);
      setTimeout(() => {
        scrollToFirstError(clientErrors);
      }, 100);
      return;
    }
    
    setLoading(true);
    setErrors({});

    try {
      const totals = calculateTotals();
      const submitData = {
        ...formData,
        due_date: formData.due_date || null,
        balance_due: formData.balance_due || null,
        subtotal: totals.subtotal,
        tax_amount: totals.tax,
        total: totals.total,
      };

      if (isEdit) {
        await invoiceService.updateInvoice(id, submitData);
      } else {
        await invoiceService.createInvoice(submitData);
      }

      navigate('/invoices');
    } catch (error) {
      console.error('Error saving invoice:', error);
      if (error.response?.data?.errors) {
        const newErrors = error.response.data.errors;
        setErrors(newErrors);
        // Scroll to first error after a short delay to ensure state is updated
        setTimeout(() => {
          scrollToFirstError(newErrors);
        }, 100);
      } else {
        alert('Failed to save invoice. Please check all fields.');
      }
    } finally {
      setLoading(false);
    }
  };

  const { subtotal, tax, total } = calculateTotals();

  if (loading && isEdit) {
    return <div className="invoice-form-container">Loading...</div>;
  }

  return (
    <div className="invoice-form-container">
      <div className="list-header">
        <div className="header-left">
          <button onClick={() => navigate('/invoices')} className="back-button">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            <span>Back to Invoices</span>
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
            <h1>{isEdit ? 'Edit Invoice' : 'Create Invoice'}</h1>
          </div>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="invoice-form">
        {/* Header Section */}
        <div className="invoice-header-section">
          <div className="invoice-header-left">
            <h1>Invoice</h1>
            <div className="invoice-number-preview">
              {isEdit ? (formData.invoice_number || 'Loading...') : 'Auto-generated on save'}
            </div>
          </div>
          <div className="invoice-header-right">
            {companyLogo && (
              <img 
                src={`${(process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '')}/storage/${companyLogo}`} 
                alt="Company Logo" 
                className="company-logo"
                onError={(e) => {
                  e.target.style.display = 'none';
                }}
              />
            )}
          </div>
        </div>

        {/* Bill To Section */}
        <div className="form-section">
          <h3>Bill To</h3>
          <div className="form-row">
            <div className="form-group">
              <label>Client *</label>
              <select
                ref={clientIdRef}
                name="client_id"
                value={formData.client_id}
                onChange={(e) => {
                  handleChange(e);
                  // Clear company when client changes
                  setFormData(prev => ({ ...prev, company_id: '' }));
                }}
                className={errors.client_id && touched.client_id ? 'error' : ''}
              >
                <option value="">Select Client</option>
                {clients.map(client => (
                  <option key={client.id} value={client.id}>
                    {client.name}
                  </option>
                ))}
              </select>
              {errors.client_id && touched.client_id && <span className="error-message">{errors.client_id[0]}</span>}
            </div>

            <div className="form-group">
              <label>Company *</label>
              <select
                ref={companyIdRef}
                name="company_id"
                value={formData.company_id}
                onChange={handleChange}
                className={errors.company_id && touched.company_id ? 'error' : ''}
                disabled={!formData.client_id || companies.length === 0}
              >
                <option value="">
                  {!formData.client_id 
                    ? 'Select Client First' 
                    : companies.length === 0 
                    ? 'No Companies Available' 
                    : 'Select Company'}
                </option>
                {companies.map(company => (
                  <option key={company.id} value={company.id}>
                    {company.name}
                  </option>
                ))}
              </select>
              {errors.company_id && touched.company_id && <span className="error-message">{errors.company_id[0]}</span>}
              {formData.client_id && companies.length === 0 && !loadingCompanies && (
                <span className="field-error" style={{ color: '#999', fontSize: '12px' }}>
                  This client has no companies assigned. Please assign companies to this client first.
                </span>
              )}
              {loadingCompanies && (
                <span className="field-error" style={{ color: '#667eea', fontSize: '12px' }}>
                  Loading companies...
                </span>
              )}
            </div>
          </div>
        </div>

        {/* Invoice Details */}
        <div className="form-section">
          <h3>Invoice Details</h3>
          <div className="form-row">
            <div className="form-group">
              <label>Date *</label>
              <input
                ref={dateRef}
                type="date"
                name="date"
                value={formData.date}
                onChange={handleChange}
                className={errors.date && touched.date ? 'error' : ''}
              />
              {errors.date && touched.date && <span className="error-message">{errors.date[0]}</span>}
            </div>

            <div className="form-group">
              <label>Due Date</label>
              <input
                type="date"
                name="due_date"
                value={formData.due_date}
                onChange={handleChange}
              />
            </div>

            <div className="form-group">
              <label>Payment Terms *</label>
              <select
                ref={paymentTermsRef}
                name="payment_terms"
                value={formData.payment_terms}
                onChange={handleChange}
                className={errors.payment_terms && touched.payment_terms ? 'error' : ''}
              >
                <option value="">Select Payment Terms</option>
                <option value="cash">Cash</option>
                <option value="credit card">Credit Card</option>
                <option value="bank transfer">Bank Transfer</option>
              </select>
              {errors.payment_terms && touched.payment_terms && <span className="error-message">{errors.payment_terms[0]}</span>}
            </div>
          </div>

          <div className="form-row">
            <div className="form-group">
              <label>Balance Due</label>
              <input
                type="number"
                name="balance_due"
                value={formData.balance_due}
                onChange={handleChange}
                step="0.01"
                min="0"
              />
            </div>

            <div className="form-group" ref={statusRef}>
              <label>Status *</label>
              <div className="radio-group">
                {['draft', 'unpaid', 'partially_paid', 'paid'].map(status => (
                  <label key={status} className="radio-label">
                    <input
                      type="radio"
                      name="status"
                      value={status}
                      checked={formData.status === status}
                      onChange={handleChange}
                    />
                    <span>{status.replace('_', ' ')}</span>
                  </label>
                ))}
              </div>
              {errors.status && touched.status && <span className="error-message">{errors.status[0]}</span>}
            </div>
          </div>
        </div>

        {/* Invoice Items */}
        <div className="form-section">
          <h3>Invoice Items</h3>
          <table className="items-table">
            <thead>
              <tr>
                <th>Description</th>
                <th>Quantity</th>
                <th>Cost Price</th>
                <th>Unit Price</th>
                <th>Subtotal</th>
                <th>Amount</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {formData.items.map((item, index) => {
                const itemSubtotal = (parseFloat(item.quantity) || 0) * (parseFloat(item.unit_price) || 0);
                return (
                  <tr key={index}>
                    <td>
                      <input
                        ref={(el) => {
                          if (el) {
                            itemsDescriptionRefs.current[index] = el;
                          }
                        }}
                        type="text"
                        value={item.description}
                        onChange={(e) => handleItemChange(index, 'description', e.target.value)}
                        className={errors[`items.${index}.description`] && touched[`items.${index}.description`] ? 'error' : ''}
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        value={item.quantity}
                        onChange={(e) => handleItemChange(index, 'quantity', e.target.value)}
                        step="0.01"
                        min="0.01"
                        className={errors[`items.${index}.quantity`] && touched[`items.${index}.quantity`] ? 'error' : ''}
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        value={item.cost_price || 0}
                        onChange={(e) => handleItemChange(index, 'cost_price', e.target.value)}
                        step="0.01"
                        min="0"
                        placeholder="0.00"
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        value={item.unit_price}
                        onChange={(e) => handleItemChange(index, 'unit_price', e.target.value)}
                        step="0.01"
                        min="0"
                        className={errors[`items.${index}.unit_price`] && touched[`items.${index}.unit_price`] ? 'error' : ''}
                      />
                    </td>
                    <td>{itemSubtotal.toFixed(2)}</td>
                    <td>{itemSubtotal.toFixed(2)}</td>
                    <td>
                      <button
                        type="button"
                        onClick={() => removeItem(index)}
                        className="btn-remove"
                        disabled={formData.items.length === 1}
                      >
                        Remove
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
          <button type="button" onClick={addItem} className="btn-add-item">
            Add Item
          </button>
        </div>

        {/* Note */}
        <div className="form-section">
          <div className="form-group">
            <label>Note</label>
            <textarea
              name="note"
              value={formData.note}
              onChange={handleChange}
              rows="4"
              placeholder="Add a note for the invoice..."
            />
          </div>
        </div>

        {/* Attachments */}
        <div className="form-section">
          <div className="form-group">
            <label>Attachments</label>
            <input
              type="file"
              multiple
              onChange={handleFileChange}
              accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
            />
          </div>
        </div>

        {/* Totals */}
        <div className="form-section totals-section">
          <div className="totals-row">
            <span>Subtotal:</span>
            <span>{subtotal.toFixed(2)}</span>
          </div>
          <div className="totals-row">
            <span>Tax (0%):</span>
            <span>{tax.toFixed(2)}</span>
          </div>
          <div className="totals-row total">
            <span>Total:</span>
            <span>{total.toFixed(2)}</span>
          </div>
        </div>

        {/* Footer Note */}
        <div className="form-section">
          <div className="invoice-footer-note">
            <p>Invoice Policy: This invoice is generated according to our company policies. For more information, visit our website at <a href="https://www.example.com" target="_blank" rel="noopener noreferrer">www.example.com</a></p>
          </div>
        </div>

        {/* Submit Button */}
        <div className="form-actions">
          <button type="button" onClick={() => navigate('/invoices')} className="btn-secondary">
            Cancel
          </button>
          <button type="submit" className="btn-primary" disabled={loading}>
            {loading ? 'Saving...' : isEdit ? 'Update Invoice' : 'Create Invoice'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default InvoiceForm;

