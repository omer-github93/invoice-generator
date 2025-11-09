import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { invoiceService, companyService, clientService } from '../services/api';
import './InvoiceForm.css';

const InvoiceForm = () => {
  const params = useParams();
  const navigate = useNavigate();
  const id = params.id;
  const isEdit = !!id;

  const [loading, setLoading] = useState(false);
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
    balance_due: 0,
    note: '',
    items: [{ description: '', quantity: 1, unit_price: 0 }],
    attachments: null,
  });

  const [errors, setErrors] = useState({});
  const [companyLogo, setCompanyLogo] = useState(null);

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
      setClients([]);
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
      const data = await clientService.getCompaniesByClient(clientId);
      setCompanies(data);
      // If editing and company_id is set, make sure it's still in the list
      if (formData.company_id && !data.find(c => c.id === parseInt(formData.company_id))) {
        // Company not found in client's companies, clear it
        setFormData(prev => ({ ...prev, company_id: '' }));
      }
    } catch (error) {
      console.error('Error loading companies for client:', error);
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
        date: invoice.date,
        due_date: invoice.due_date,
        payment_terms: invoice.payment_terms || 'cash',
        status: invoice.status,
        balance_due: invoice.balance_due,
        note: invoice.note || '',
        items: invoice.items.map(item => ({
          description: item.description,
          quantity: item.quantity,
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
      items: [...prev.items, { description: '', quantity: 1, unit_price: 0 }],
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

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setErrors({});

    try {
      const totals = calculateTotals();
      const submitData = {
        ...formData,
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
        setErrors(error.response.data.errors);
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
      <div className="invoice-form-header">
        <h2>{isEdit ? 'Edit Invoice' : 'Create Invoice'}</h2>
        <button onClick={() => navigate('/invoices')} className="btn-secondary">
          Back to Invoices
        </button>
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
                name="client_id"
                value={formData.client_id}
                onChange={(e) => {
                  handleChange(e);
                  // Clear company when client changes
                  setFormData(prev => ({ ...prev, company_id: '' }));
                }}
                className={errors.client_id ? 'error' : ''}
                required
              >
                <option value="">Select Client</option>
                {clients.map(client => (
                  <option key={client.id} value={client.id}>
                    {client.name}
                  </option>
                ))}
              </select>
              {errors.client_id && <span className="error-message">{errors.client_id[0]}</span>}
            </div>

            <div className="form-group">
              <label>Company *</label>
              <select
                name="company_id"
                value={formData.company_id}
                onChange={handleChange}
                className={errors.company_id ? 'error' : ''}
                required
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
              {errors.company_id && <span className="error-message">{errors.company_id[0]}</span>}
              {formData.client_id && companies.length === 0 && (
                <span className="field-error" style={{ color: '#999', fontSize: '12px' }}>
                  This client has no companies assigned. Please assign companies to this client first.
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
                type="date"
                name="date"
                value={formData.date}
                onChange={handleChange}
                className={errors.date ? 'error' : ''}
                required
              />
              {errors.date && <span className="error-message">{errors.date[0]}</span>}
            </div>

            <div className="form-group">
              <label>Due Date *</label>
              <input
                type="date"
                name="due_date"
                value={formData.due_date}
                onChange={handleChange}
                className={errors.due_date ? 'error' : ''}
                required
              />
              {errors.due_date && <span className="error-message">{errors.due_date[0]}</span>}
            </div>

            <div className="form-group">
              <label>Payment Terms</label>
              <input
                type="text"
                name="payment_terms"
                value={formData.payment_terms}
                onChange={handleChange}
                placeholder="e.g., cash"
              />
            </div>
          </div>

          <div className="form-row">
            <div className="form-group">
              <label>Balance Due *</label>
              <input
                type="number"
                name="balance_due"
                value={formData.balance_due}
                onChange={handleChange}
                step="0.01"
                min="0"
                className={errors.balance_due ? 'error' : ''}
                required
              />
              {errors.balance_due && <span className="error-message">{errors.balance_due[0]}</span>}
            </div>

            <div className="form-group">
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
              {errors.status && <span className="error-message">{errors.status[0]}</span>}
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
                        type="text"
                        value={item.description}
                        onChange={(e) => handleItemChange(index, 'description', e.target.value)}
                        className={errors[`items.${index}.description`] ? 'error' : ''}
                        required
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        value={item.quantity}
                        onChange={(e) => handleItemChange(index, 'quantity', e.target.value)}
                        step="0.01"
                        min="0.01"
                        className={errors[`items.${index}.quantity`] ? 'error' : ''}
                        required
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        value={item.unit_price}
                        onChange={(e) => handleItemChange(index, 'unit_price', e.target.value)}
                        step="0.01"
                        min="0"
                        className={errors[`items.${index}.unit_price`] ? 'error' : ''}
                        required
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

