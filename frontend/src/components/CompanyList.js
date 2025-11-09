import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { companyService } from '../services/api';
import ConfirmDialog from './ConfirmDialog';
import './CompanyList.css';

const CompanyList = () => {
  const navigate = useNavigate();
  const [companies, setCompanies] = useState([]);
  const [loading, setLoading] = useState(false);
  const [filters, setFilters] = useState({
    search: '',
  });
  const [pagination, setPagination] = useState({
    current_page: 1,
    per_page: 10,
    total: 0,
    last_page: 1,
  });
  const [deleteDialog, setDeleteDialog] = useState({ isOpen: false, id: null, name: '' });

  useEffect(() => {
    loadCompanies();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pagination.current_page, pagination.per_page, filters.search]);

  const loadCompanies = async () => {
    try {
      setLoading(true);
      const params = {
        page: pagination.current_page,
        per_page: pagination.per_page,
        search: filters.search || undefined,
      };
      
      // Remove undefined values
      Object.keys(params).forEach(key => {
        if (params[key] === undefined || params[key] === '') {
          delete params[key];
        }
      });

      const response = await companyService.getCompanies(params);
      
      // Handle response - could be { data: [], total: 0, ... } or just []
      if (response && typeof response === 'object') {
        if (Array.isArray(response)) {
          // Direct array response
          setCompanies(response);
          setPagination(prev => ({
            ...prev,
            total: response.length,
            last_page: Math.ceil(response.length / prev.per_page),
          }));
        } else if (response.data !== undefined) {
          // Paginated response
          setCompanies(Array.isArray(response.data) ? response.data : []);
          setPagination(prev => ({
            ...prev,
            total: response.total || 0,
            current_page: response.current_page || prev.current_page,
            last_page: response.last_page || Math.ceil((response.total || 0) / prev.per_page),
          }));
        } else {
          setCompanies([]);
        }
      } else {
        setCompanies([]);
      }
    } catch (error) {
      console.error('Error loading companies:', error);
      console.error('Error response:', error.response);
      setCompanies([]);
      setPagination(prev => ({
        ...prev,
        total: 0,
        last_page: 1,
      }));
      if (error.response?.status !== 404) {
        alert('Failed to load companies. Please check the console for details.');
      }
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
      current_page: 1,
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

  const handleDeleteClick = (id, name) => {
    setDeleteDialog({ isOpen: true, id, name });
  };

  const handleDeleteConfirm = async () => {
    if (!deleteDialog.id) return;

    try {
      await companyService.deleteCompany(deleteDialog.id);
      setDeleteDialog({ isOpen: false, id: null, name: '' });
      loadCompanies();
    } catch (error) {
      console.error('Error deleting company:', error);
      alert('Failed to delete company');
    }
  };

  const handleDeleteCancel = () => {
    setDeleteDialog({ isOpen: false, id: null, name: '' });
  };

  return (
    <div className="company-list-container">
      {/* Beautiful Header */}
      <div className="list-header">
        <div className="header-left">
          <button onClick={() => navigate('/dashboard')} className="back-button">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            Back to Dashboard
          </button>
          <h1>Companies</h1>
        </div>
        <button onClick={() => navigate('/companies/new')} className="btn-primary">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
            <line x1="12" y1="5" x2="12" y2="19"></line>
            <line x1="5" y1="12" x2="19" y2="12"></line>
          </svg>
          Create Company
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
              placeholder="Search by name or address..."
            />
          </div>
        </div>
      </div>

      {/* Table */}
      <div className="table-container">
        {loading ? (
          <div className="loading">Loading...</div>
        ) : (
          <table className="companies-table">
            <thead>
              <tr>
                <th>Logo</th>
                <th>Name</th>
                <th>Address</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {companies.length === 0 ? (
                <tr>
                  <td colSpan="4" className="no-data">
                    No companies found
                  </td>
                </tr>
              ) : (
                companies.map((company) => (
                  <tr key={company.id}>
                    <td>
                      {company.logo_path ? (
                        <img 
                          src={`${(process.env.REACT_APP_API_URL || 'http://localhost:8000/api').replace('/api', '')}/storage/${company.logo_path}`} 
                          alt={company.name}
                          className="company-logo-small"
                        />
                      ) : (
                        <span className="no-logo">No logo</span>
                      )}
                    </td>
                    <td>{company.name}</td>
                    <td>{company.address || '-'}</td>
                    <td>
                      <div className="action-buttons">
                        <button
                          onClick={() => navigate(`/companies/${company.id}/edit`)}
                          className="btn-action btn-edit"
                          title="Edit"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleDeleteClick(company.id, company.name)}
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
      {pagination.total > 0 && (
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
              {Array.from({ length: Math.min(5, pagination.last_page) }, (_, i) => {
                let page;
                if (pagination.last_page <= 5) {
                  page = i + 1;
                } else if (pagination.current_page <= 3) {
                  page = i + 1;
                } else if (pagination.current_page >= pagination.last_page - 2) {
                  page = pagination.last_page - 4 + i;
                } else {
                  page = pagination.current_page - 2 + i;
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
      )}

      {/* Delete Confirmation Dialog */}
      <ConfirmDialog
        isOpen={deleteDialog.isOpen}
        onClose={handleDeleteCancel}
        onConfirm={handleDeleteConfirm}
        title="Delete Company"
        message={`Are you sure you want to delete "${deleteDialog.name}"? This action cannot be undone.`}
      />
    </div>
  );
};

export default CompanyList;
