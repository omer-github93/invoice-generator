import React, { useState, useEffect, useRef } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { clientService, companyService } from '../../services/api';
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
  const [companySearchTerm, setCompanySearchTerm] = useState('');
  const [isCompanyDropdownOpen, setIsCompanyDropdownOpen] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [redirecting, setRedirecting] = useState(false);
  
  // Refs for required fields
  const nameRef = useRef(null);
  const companyIdsRef = useRef(null);
  const companyDropdownRef = useRef(null);
  const companySearchInputRef = useRef(null);

  useEffect(() => {
    loadCompanies();
    if (isEdit) {
      loadClient();
    }
  }, [id]);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (companyDropdownRef.current && !companyDropdownRef.current.contains(event.target)) {
        setIsCompanyDropdownOpen(false);
        setTouched(prev => ({ ...prev, company_ids: true }));
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

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

  const handleCompanyToggle = (companyId) => {
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
    
    if (errors.company_ids) {
      setErrors({ ...errors, company_ids: '' });
    }
  };

  const handleRemoveCompany = (companyId, e) => {
    e.stopPropagation();
    setFormData(prev => ({
      ...prev,
      company_ids: prev.company_ids.filter(id => id !== companyId),
    }));
  };

  const filteredCompanies = companies.filter(company =>
    company.name.toLowerCase().includes(companySearchTerm.toLowerCase())
  );

  const getSelectedCompanyNames = () => {
    return formData.company_ids
      .map(id => companies.find(c => c.id === id)?.name)
      .filter(Boolean);
  };

  const scrollToFirstError = (errors) => {
    if (errors.name) {
      nameRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => nameRef.current?.focus(), 300);
      return;
    }
    if (errors.company_ids) {
      companyIdsRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' });
      setTimeout(() => {
        setIsCompanyDropdownOpen(true);
        companySearchInputRef.current?.focus();
      }, 300);
      return;
    }
    if (errors.email) {
      // Email is optional, but if there's an error, scroll to it
      const emailInput = document.getElementById('email');
      if (emailInput) {
        emailInput.scrollIntoView({ behavior: 'smooth', block: 'center' });
        setTimeout(() => emailInput.focus(), 300);
      }
      return;
    }
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
    return { isValid, errors: newErrors };
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const validation = validateForm();
    if (!validation.isValid) {
      // Scroll to first error
      setTimeout(() => {
        scrollToFirstError(validation.errors);
      }, 100);
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

      setShowSuccessModal(true);
      setRedirecting(true);
      
      setTimeout(() => {
        navigate('/clients');
      }, 2000);
    } catch (error) {
      console.error('Error saving client:', error);
      if (error.response?.data?.errors) {
        const serverErrors = {};
        Object.keys(error.response.data.errors).forEach(key => {
          serverErrors[key] = error.response.data.errors[key][0];
        });
        setErrors(serverErrors);
        // Scroll to first error after setting errors
        setTimeout(() => {
          scrollToFirstError(serverErrors);
        }, 100);
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
      <div className="list-header">
        <div className="header-left">
          <button onClick={() => navigate('/clients')} className="back-button">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            <span>Back to Clients</span>
          </button>
          <div className="header-title-section">
            <div className="header-icon-wrapper">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
              </svg>
            </div>
            <h1>{isEdit ? 'Edit Client' : 'Create Client'}</h1>
          </div>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="client-form" noValidate>
        <div className="form-group">
          <label htmlFor="name">Client Name *</label>
          <input
            type="text"
            id="name"
            name="name"
            ref={nameRef}
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

        <div className="form-group" ref={companyIdsRef}>
          <label htmlFor="company_ids">Companies *</label>
          <div 
            className={`custom-multi-select ${errors.company_ids && touched.company_ids ? 'error' : ''} ${isCompanyDropdownOpen ? 'open' : ''}`}
            ref={companyDropdownRef}
          >
            <div 
              className="multi-select-input"
              onClick={() => {
                if (!loading) {
                  setIsCompanyDropdownOpen(!isCompanyDropdownOpen);
                  setTimeout(() => companySearchInputRef.current?.focus(), 100);
                }
              }}
            >
              <div className="selected-companies">
                {formData.company_ids.length === 0 ? (
                  <span className="placeholder">Select companies...</span>
                ) : (
                  getSelectedCompanyNames().map((name, index) => {
                    const companyId = companies.find(c => c.name === name)?.id;
                    return (
                      <span key={companyId || index} className="selected-tag">
                        {name}
                        <button
                          type="button"
                          onClick={(e) => handleRemoveCompany(companyId, e)}
                          className="remove-tag"
                          disabled={loading}
                        >
                          ×
                        </button>
                      </span>
                    );
                  })
                )}
              </div>
              <svg 
                className={`dropdown-arrow ${isCompanyDropdownOpen ? 'open' : ''}`}
                width="20" 
                height="20" 
                viewBox="0 0 24 24" 
                fill="none" 
                stroke="currentColor" 
                strokeWidth="2"
              >
                <polyline points="6 9 12 15 18 9"></polyline>
              </svg>
            </div>
            {isCompanyDropdownOpen && (
              <div className="multi-select-dropdown">
                <div className="search-box">
                  <input
                    ref={companySearchInputRef}
                    type="text"
                    placeholder="Search companies..."
                    value={companySearchTerm}
                    onChange={(e) => setCompanySearchTerm(e.target.value)}
                    className="company-search-input"
                  />
                </div>
                <div className="options-list">
                  {filteredCompanies.length === 0 ? (
                    <div className="no-options">No companies found</div>
                  ) : (
                    filteredCompanies.map((company) => (
                      <label
                        key={company.id}
                        className={`option-item ${formData.company_ids.includes(company.id) ? 'selected' : ''}`}
                      >
                        <input
                          type="checkbox"
                          checked={formData.company_ids.includes(company.id)}
                          onChange={() => handleCompanyToggle(company.id)}
                          disabled={loading}
                        />
                        <span>{company.name}</span>
                      </label>
                    ))
                  )}
                </div>
              </div>
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

      {showSuccessModal && (
        <div className="success-modal-overlay">
          <div className="success-modal">
            <div className="success-icon-wrapper">
              <svg className="success-icon" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                <polyline points="22 4 12 14.01 9 11.01"></polyline>
              </svg>
            </div>
            <h2>Client {isEdit ? 'Updated' : 'Created'} Successfully!</h2>
            <p>Your client has been {isEdit ? 'updated' : 'saved'}.</p>
            {redirecting && (
              <div className="redirect-loader">
                <div className="spinner"></div>
                <span>Redirecting to clients list...</span>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default ClientForm;

