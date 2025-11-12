import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { settingService } from '../../services/api';
import './Settings.css';

const Settings = () => {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [darkMode, setDarkMode] = useState(() => {
    const saved = localStorage.getItem('darkMode');
    return saved === 'true';
  });
  const [formData, setFormData] = useState({
    name: '',
    logo_tagline: '',
    address: '',
    phone: '',
    email: '',
    privacy_and_policy: '',
    logo: null,
  });
  const [logoPreview, setLogoPreview] = useState(null);
  const [existingLogo, setExistingLogo] = useState(null);
  const [errors, setErrors] = useState({});
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [redirecting, setRedirecting] = useState(false);

  useEffect(() => {
    loadSettings();
    applyDarkMode(darkMode);
  }, []);

  useEffect(() => {
    applyDarkMode(darkMode);
  }, [darkMode]);

  const applyDarkMode = (isDark) => {
    if (isDark) {
      document.documentElement.classList.add('dark-mode');
    } else {
      document.documentElement.classList.remove('dark-mode');
    }
  };

  const loadSettings = async () => {
    try {
      setLoading(true);
      const settings = await settingService.getSettings();
      setFormData({
        name: settings.name || '',
        logo_tagline: settings.logo_tagline || '',
        address: settings.address || '',
        phone: settings.phone || '',
        email: settings.email || '',
        privacy_and_policy: settings.privacy_and_policy || '',
        logo: null,
      });
      if (settings.logo) {
        // Construct the full URL to the logo
        // settings.logo is like: uploads/setting/filename.jpg
        // We need: http://localhost:8000/storage/uploads/setting/filename.jpg
        const apiUrl = (process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '');
        const logoUrl = `${apiUrl}/storage/${settings.logo}`;
        setExistingLogo(logoUrl);
        setLogoPreview(logoUrl);
      } else {
        // Clear preview if no logo exists
        setLogoPreview(null);
        setExistingLogo(null);
      }
    } catch (error) {
      console.error('Error loading settings:', error);
      alert('Failed to load settings');
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
      
      const reader = new FileReader();
      reader.onloadend = () => {
        setLogoPreview(reader.result);
      };
      reader.readAsDataURL(file);
    } else {
      // If no file selected, set logo to null (not empty string)
      setFormData(prev => ({
        ...prev,
        logo: null,
      }));
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    const newErrors = {};
    if (!formData.name.trim()) {
      newErrors.name = 'Company name is required';
    }
    
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    }

    try {
      setSaving(true);
      const submitData = new FormData();
      submitData.append('name', formData.name);
      submitData.append('logo_tagline', formData.logo_tagline || '');
      submitData.append('address', formData.address || '');
      submitData.append('phone', formData.phone || '');
      submitData.append('email', formData.email || '');
      submitData.append('privacy_and_policy', formData.privacy_and_policy || '');
      
      // Only append logo if a new file was selected
      // Don't send anything if no new logo is being uploaded
      if (formData.logo && formData.logo instanceof File) {
        submitData.append('logo', formData.logo);
      }

      const updatedSettings = await settingService.updateSettings(submitData);
      
      // Update logo preview if a new logo was uploaded
      if (updatedSettings.logo) {
        const apiUrl = (process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '');
        const logoUrl = `${apiUrl}/storage/${updatedSettings.logo}`;
        setLogoPreview(logoUrl);
        setExistingLogo(logoUrl);
      }
      
      // Show success modal
      setShowSuccessModal(true);
      setRedirecting(true);
      
      // Redirect to dashboard after 2 seconds
      setTimeout(() => {
        navigate('/dashboard');
      }, 2000);
    } catch (error) {
      console.error('Error saving settings:', error);
      if (error.response?.data?.errors) {
        setErrors(error.response.data.errors);
      } else {
        alert('Failed to save settings');
      }
    } finally {
      setSaving(false);
    }
  };

  const toggleDarkMode = () => {
    const newMode = !darkMode;
    setDarkMode(newMode);
    localStorage.setItem('darkMode', newMode.toString());
  };

  if (loading) {
    return <div className="settings-container">Loading...</div>;
  }

  return (
    <div className="settings-container">
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
                <circle cx="12" cy="12" r="3"></circle>
                <path d="M12 1v6m0 6v6M5.64 5.64l4.24 4.24m4.24 4.24l4.24 4.24M1 12h6m6 0h6M5.64 18.36l4.24-4.24m4.24-4.24l4.24-4.24"></path>
              </svg>
            </div>
            <h1>Settings</h1>
          </div>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="settings-form" noValidate>
        {/* Dark Mode Toggle */}
        <div className="settings-section">
          <div className="section-header">
            <h2>Appearance</h2>
          </div>
          <div className="dark-mode-toggle-container">
            <div className="dark-mode-label">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                {darkMode ? (
                  <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                ) : (
                  <>
                    <circle cx="12" cy="12" r="5"></circle>
                    <line x1="12" y1="1" x2="12" y2="3"></line>
                    <line x1="12" y1="21" x2="12" y2="23"></line>
                    <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
                    <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
                    <line x1="1" y1="12" x2="3" y2="12"></line>
                    <line x1="21" y1="12" x2="23" y2="12"></line>
                    <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
                    <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
                  </>
                )}
              </svg>
              <span>{darkMode ? 'Dark Mode' : 'Light Mode'}</span>
            </div>
            <button
              type="button"
              className={`dark-mode-switch ${darkMode ? 'active' : ''}`}
              onClick={toggleDarkMode}
            >
              <div className="switch-slider"></div>
            </button>
          </div>
        </div>

        {/* Company Information */}
        <div className="settings-section">
          <div className="section-header">
            <h2>Company Information</h2>
            <p>This information will be used in your invoices</p>
          </div>

          <div className="form-group">
            <label htmlFor="name">Company Name *</label>
            <input
              type="text"
              id="name"
              name="name"
              value={formData.name}
              onChange={handleChange}
              placeholder="Enter company name"
              disabled={saving}
              className={errors.name ? 'error' : ''}
            />
            {errors.name && <span className="field-error">{errors.name}</span>}
          </div>

          <div className="form-group">
            <label htmlFor="logo_tagline">Logo Tagline</label>
            <input
              type="text"
              id="logo_tagline"
              name="logo_tagline"
              value={formData.logo_tagline}
              onChange={handleChange}
              placeholder="Enter company tagline"
              disabled={saving}
            />
          </div>

          <div className="form-group">
            <label htmlFor="logo">Company Logo</label>
            <input
              type="file"
              id="logo"
              name="logo"
              accept="image/*"
              onChange={handleLogoChange}
              disabled={saving}
            />
            {logoPreview && (
              <div className="logo-preview">
                <img src={logoPreview} alt="Logo preview" />
              </div>
            )}
          </div>

          <div className="form-group">
            <label htmlFor="address">Address</label>
            <textarea
              id="address"
              name="address"
              value={formData.address}
              onChange={handleChange}
              placeholder="Enter company address"
              disabled={saving}
              rows="3"
            />
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
              disabled={saving}
            />
          </div>

          <div className="form-group">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              placeholder="Enter email address"
              disabled={saving}
              className={errors.email ? 'error' : ''}
            />
            {errors.email && <span className="field-error">{errors.email}</span>}
          </div>
        </div>

        {/* Privacy & Policy */}
        <div className="settings-section">
          <div className="section-header">
            <h2>Privacy & Policy</h2>
            <p>This text will appear at the bottom of your invoices</p>
          </div>

          <div className="form-group">
            <label htmlFor="privacy_and_policy">Privacy & Policy Text</label>
            <textarea
              id="privacy_and_policy"
              name="privacy_and_policy"
              value={formData.privacy_and_policy}
              onChange={handleChange}
              placeholder="Enter privacy and policy text"
              disabled={saving}
              rows="5"
            />
          </div>
        </div>

        <div className="form-actions">
          <button type="button" onClick={() => navigate('/dashboard')} className="btn-secondary" disabled={saving}>
            Cancel
          </button>
          <button type="submit" className="btn-primary" disabled={saving}>
            {saving ? 'Saving...' : 'Save Settings'}
          </button>
        </div>
      </form>

      {/* Success Modal */}
      {showSuccessModal && (
        <div className="success-modal-overlay">
          <div className="success-modal">
            <div className="success-icon-wrapper">
              <svg className="success-icon" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                <polyline points="22 4 12 14.01 9 11.01"></polyline>
              </svg>
            </div>
            <h2>Settings Updated Successfully!</h2>
            <p>Your company information has been saved.</p>
            {redirecting && (
              <div className="redirect-loader">
                <div className="spinner"></div>
                <span>Redirecting to dashboard...</span>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default Settings;

