import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { clientService, companyService } from '../services/api';
import './ClientForm.css';

const ClientForm = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const isEdit = !!id;

  const [loading, setLoading] = useState(false);
  const [companies, setCompanies] = useState([]);
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    company_ids: [],
  });
  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});

  useEffect(() => {
    loadCompanies();
    if (isEdit) {
      loadClient();
    }
  }, [id]);

  const loadCompanies = async () => {
    try {
      // Load all companies for selection
      const response = await companyService.getCompanies({ per_page: 1000, page: 1 });
      const companiesData = response.data || response;
      setCompanies(Array.isArray(companiesData) ? companiesData : []);
    } catch (error) {
      console.error('Error loading companies:', error);
      setCompanies([]);
    }
  };

  const loadClient = async () => {
    try {
      setLoading(true);
      const client = await clientService.getClient(id);
      setFormData({
        name: client.name || '',
        email: client.email || '',
        phone: client.phone || '',
        company_ids: client.companies ? client.companies.map(c => c.id) : [],
      });
    } catch (error) {
      console.error('Error loading client:', error);
      alert('Failed to load client');
    } finally {
      setLoading(false);
    }
  };

  const validateField = (name, value) => {
    let error = '';
    if (name === 'name') {
      if (!value || value.trim() === '') {
        error = 'Client name is required';
      }
    } else if (name === 'email' && value) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(value)) {
        error = 'Please enter a valid email address';
      }
    }
    return error;
  };

  const handleBlur = (field) => {
    setTouched({ ...touched, [field]: true });
    const value = formData[field];
    const error = validateField(field, value);
    setErrors({ ...errors, [field]: error });
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value,
    }));
    
    if (errors[name]) {
      setErrors({ ...errors, [name]: '' });
    }
  };

  const handleCompanyChange = (companyId) => {
    const companyIdNum = parseInt(companyId);
    setFormData(prev => {
      const companyIds = prev.company_ids.includes(companyIdNum)
        ? prev.company_ids.filter(id => id !== companyIdNum)
        : [...prev.company_ids, companyIdNum];
      return {
        ...prev,
        company_ids: companyIds,
      };
    });
  };

  const validateForm = () => {
    const newErrors = {};
    let isValid = true;

    const nameError = validateField('name', formData.name);
    if (nameError) {
      newErrors.name = nameError;
      isValid = false;
    }

    if (formData.email) {
      const emailError = validateField('email', formData.email);
      if (emailError) {
        newErrors.email = emailError;
        isValid = false;
      }
    }

    if (formData.company_ids.length === 0) {
      newErrors.company_ids = 'At least one company must be selected';
      isValid = false;
    }

    setErrors(newErrors);
    setTouched({ name: true, email: true, company_ids: true });
    return isValid;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) {
      return;
    }

    setLoading(true);

    try {
      const submitData = {
        name: formData.name,
        email: formData.email || null,
        phone: formData.phone || null,
        company_ids: formData.company_ids,
      };

      if (isEdit) {
        await clientService.updateClient(id, submitData);
      } else {
        await clientService.createClient(submitData);
      }

      navigate('/clients');
    } catch (error) {
      console.error('Error saving client:', error);
      if (error.response?.data?.errors) {
        const serverErrors = {};
        Object.keys(error.response.data.errors).forEach(key => {
          serverErrors[key] = error.response.data.errors[key][0];
        });
        setErrors(serverErrors);
      } else {
        alert('Failed to save client. Please check all fields.');
      }
    } finally {
      setLoading(false);
    }
  };

  if (loading && isEdit) {
    return <div className="client-form-container">Loading...</div>;
  }

  return (
    <div className="client-form-container">
      <div className="client-form-header">
        <h2>{isEdit ? 'Edit Client' : 'Create Client'}</h2>
        <button onClick={() => navigate('/clients')} className="btn-secondary">
          Back to Clients
        </button>
      </div>

      <form onSubmit={handleSubmit} className="client-form" noValidate>
        <div className="form-group">
          <label htmlFor="name">Client Name *</label>
          <input
            type="text"
            id="name"
            name="name"
            value={formData.name}
            onChange={handleChange}
            onBlur={() => handleBlur('name')}
            placeholder="Enter client name"
            disabled={loading}
            className={errors.name && touched.name ? 'error' : ''}
          />
          {errors.name && touched.name && (
            <span className="field-error">{errors.name}</span>
          )}
        </div>

        <div className="form-group">
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            onBlur={() => handleBlur('email')}
            placeholder="Enter email address"
            disabled={loading}
            className={errors.email && touched.email ? 'error' : ''}
          />
          {errors.email && touched.email && (
            <span className="field-error">{errors.email}</span>
          )}
        </div>

        <div className="form-group">
          <label htmlFor="phone">Phone</label>
          <input
            type="text"
            id="phone"
            name="phone"
            value={formData.phone}
            onChange={handleChange}
            placeholder="Enter phone number"
            disabled={loading}
          />
        </div>

        <div className="form-group">
          <label>Companies *</label>
          <div className="company-checkboxes">
            {companies.length === 0 ? (
              <p className="no-companies">No companies available. Please create companies first.</p>
            ) : (
              companies.map((company) => (
                <label key={company.id} className="checkbox-label">
                  <input
                    type="checkbox"
                    checked={formData.company_ids.includes(company.id)}
                    onChange={() => handleCompanyChange(company.id)}
                    disabled={loading}
                  />
                  <span>{company.name}</span>
                </label>
              ))
            )}
          </div>
          {errors.company_ids && touched.company_ids && (
            <span className="field-error">{errors.company_ids}</span>
          )}
        </div>

        <div className="form-actions">
          <button type="button" onClick={() => navigate('/clients')} className="btn-secondary">
            Cancel
          </button>
          <button type="submit" className="btn-primary" disabled={loading}>
            {loading ? 'Saving...' : isEdit ? 'Update Client' : 'Create Client'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default ClientForm;

