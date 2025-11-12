import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { clientService } from '../../services/api';
import ConfirmDialog from '../../components/ConfirmDialog';
import './ClientList.css';

const ClientList = () => {
  const navigate = useNavigate();
  const [clients, setClients] = useState([]);
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
    loadClients();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pagination.current_page, pagination.per_page, filters.search]);

  const loadClients = async () => {
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

      const response = await clientService.getClients(params);
      
      // Handle response - could be { data: [], total: 0, ... } or just []
      if (response && typeof response === 'object') {
        if (Array.isArray(response)) {
          // Direct array response
          setClients(response);
          setPagination(prev => ({
            ...prev,
            total: response.length,
            last_page: Math.ceil(response.length / prev.per_page),
          }));
        } else if (response.data !== undefined) {
          // Paginated response
          setClients(Array.isArray(response.data) ? response.data : []);
          setPagination(prev => ({
            ...prev,
            total: response.total || 0,
            current_page: response.current_page || prev.current_page,
            last_page: response.last_page || Math.ceil((response.total || 0) / prev.per_page),
          }));
        } else {
          setClients([]);
        }
      } else {
        setClients([]);
      }
    } catch (error) {
      console.error('Error loading clients:', error);
      console.error('Error response:', error.response);
      console.error('Error details:', error.response?.data);
      setClients([]);
      setPagination(prev => ({
        ...prev,
        total: 0,
        last_page: 1,
      }));
      if (error.response?.status !== 404) {
        alert('Failed to load clients. Please check the console for details.');
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
      await clientService.deleteClient(deleteDialog.id);
      setDeleteDialog({ isOpen: false, id: null, name: '' });
      loadClients();
    } catch (error) {
      console.error('Error deleting client:', error);
      alert('Failed to delete client');
    }
  };

  const handleDeleteCancel = () => {
    setDeleteDialog({ isOpen: false, id: null, name: '' });
  };

  return (
    <div className="client-list-container">
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
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
              </svg>
            </div>
            <h1>Clients</h1>
          </div>
        </div>
        <button onClick={() => navigate('/clients/new')} className="btn-create-invoice">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
            <line x1="12" y1="5" x2="12" y2="19"></line>
            <line x1="5" y1="12" x2="19" y2="12"></line>
          </svg>
          <span>Create Client</span>
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
              placeholder="Search by name, email, or phone..."
            />
          </div>
        </div>
      </div>

      {/* Table */}
      <div className="table-container">
        {loading ? (
          <div className="loading">Loading...</div>
        ) : (
          <table className="clients-table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Companies</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {clients.length === 0 ? (
                <tr>
                  <td colSpan="5" className="no-data">
                    No clients found
                  </td>
                </tr>
              ) : (
                clients.map((client) => (
                  <tr key={client.id}>
                    <td>{client.name}</td>
                    <td>{client.email || '-'}</td>
                    <td>{client.phone || '-'}</td>
                    <td>
                      {client.companies && client.companies.length > 0 ? (
                        <div className="companies-list">
                          {client.companies.map((company, index) => (
                            <span key={company.id} className="company-badge">
                              {company.name}
                              {index < client.companies.length - 1 && ', '}
                            </span>
                          ))}
                        </div>
                      ) : (
                        '-'
                      )}
                    </td>
                    <td>
                      <div className="action-buttons">
                        <button
                          onClick={() => navigate(`/clients/${client.id}/edit`)}
                          className="btn-action btn-edit"
                          title="Edit"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleDeleteClick(client.id, client.name)}
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
        title="Delete Client"
        message={`Are you sure you want to delete "${deleteDialog.name}"? This action cannot be undone.`}
      />
    </div>
  );
};

export default ClientList;
