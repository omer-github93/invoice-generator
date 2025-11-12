import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { companyService } from '../../services/api';
import './CompanyForm.css';

const CompanyForm = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const isEdit = !!id;

  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    name: '',
    address: '',
    logo: null,
  });
  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});
  const [logoPreview, setLogoPreview] = useState(null);
  const [existingLogo, setExistingLogo] = useState(null);

  useEffect(() => {
    if (isEdit) {
      loadCompany();
    }
  }, [id]);

  const loadCompany = async () => {
    try {
      setLoading(true);
      const company = await companyService.getCompany(id);
      setFormData({
        name: company.name || '',
        address: company.address || '',
        logo: null,
      });
      if (company.logo_path) {
        setExistingLogo(company.logo_path);
        setLogoPreview(`${(process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '')}/storage/${company.logo_path}`);
      }
    } catch (error) {
      console.error('Error loading company:', error);
      alert('Failed to load company');
    } finally {
      setLoading(false);
    }
  };

  const validateField = (name, value) => {
    let error = '';
    if (name === 'name') {
      if (!value || value.trim() === '') {
        error = 'Company name is required';
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
    
    // Clear error when user starts typing
    if (errors[name]) {
      setErrors({ ...errors, [name]: '' });
    }
  };

  const handleLogoChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setFormData(prev => ({
        ...prev,
        logo: file,
      }));
      
      // Create preview
      const reader = new FileReader();
      reader.onloadend = () => {
        setLogoPreview(reader.result);
      };
      reader.readAsDataURL(file);
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

    setErrors(newErrors);
    setTouched({ name: true });
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
        address: formData.address,
        logo: formData.logo,
      };

      if (isEdit) {
        await companyService.updateCompany(id, submitData);
      } else {
        await companyService.createCompany(submitData);
      }

      navigate('/companies');
    } catch (error) {
      console.error('Error saving company:', error);
      if (error.response?.data?.errors) {
        const serverErrors = {};
        Object.keys(error.response.data.errors).forEach(key => {
          serverErrors[key] = error.response.data.errors[key][0];
        });
        setErrors(serverErrors);
      } else {
        alert('Failed to save company. Please check all fields.');
      }
    } finally {
      setLoading(false);
    }
  };

  if (loading && isEdit) {
    return <div className="company-form-container">Loading...</div>;
  }

  return (
    <div className="company-form-container">
      <div className="list-header">
        <div className="header-left">
          <button onClick={() => navigate('/companies')} className="back-button">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            <span>Back to Companies</span>
          </button>
          <div className="header-title-section">
            <div className="header-icon-wrapper">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                <line x1="16" y1="2" x2="16" y2="6"></line>
                <line x1="8" y1="2" x2="8" y2="6"></line>
                <line x1="3" y1="10" x2="21" y2="10"></line>
              </svg>
            </div>
            <h1>{isEdit ? 'Edit Company' : 'Create Company'}</h1>
          </div>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="company-form" noValidate>
        <div className="form-group">
          <label htmlFor="name">Company Name *</label>
          <input
            type="text"
            id="name"
            name="name"
            value={formData.name}
            onChange={handleChange}
            onBlur={() => handleBlur('name')}
            placeholder="Enter company name"
            disabled={loading}
            className={errors.name && touched.name ? 'error' : ''}
          />
          {errors.name && touched.name && (
            <span className="field-error">{errors.name}</span>
          )}
        </div>

        <div className="form-group">
          <label htmlFor="address">Address</label>
          <input
            type="text"
            id="address"
            name="address"
            value={formData.address}
            onChange={handleChange}
            placeholder="Enter company address"
            disabled={loading}
          />
        </div>

        <div className="form-group">
          <label htmlFor="logo">Logo (Optional)</label>
          <input
            type="file"
            id="logo"
            name="logo"
            accept="image/*"
            onChange={handleLogoChange}
            disabled={loading}
          />
          {(logoPreview || existingLogo) && (
            <div className="logo-preview">
              <img src={logoPreview || `${(process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '')}/storage/${existingLogo}`} alt="Logo preview" />
            </div>
          )}
        </div>

        <div className="form-actions">
          <button type="button" onClick={() => navigate('/companies')} className="btn-secondary">
            Cancel
          </button>
          <button type="submit" className="btn-primary" disabled={loading}>
            {loading ? 'Saving...' : isEdit ? 'Update Company' : 'Create Company'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default CompanyForm;

