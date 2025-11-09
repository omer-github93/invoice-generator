import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000/api';

const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

// Add token to requests if available
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Handle token expiration
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export const authService = {
  login: async (username, password) => {
    const response = await api.post('/login', { username, password });
    if (response.data.token) {
      localStorage.setItem('token', response.data.token);
      localStorage.setItem('user', JSON.stringify(response.data.user));
    }
    return response.data;
  },

  logout: async () => {
    try {
      await api.post('/logout');
    } catch (error) {
      console.error('Logout error:', error);
    } finally {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
    }
  },

  getMe: async () => {
    const response = await api.get('/me');
    return response.data;
  },
};

export const invoiceService = {
  getInvoices: async (params = {}) => {
    const response = await api.get('/invoices', { params });
    return response.data;
  },

  getInvoice: async (id) => {
    const response = await api.get(`/invoices/${id}`);
    return response.data;
  },

  createInvoice: async (data) => {
    const formData = new FormData();
    
    Object.keys(data).forEach(key => {
      if (key === 'items') {
        data[key].forEach((item, index) => {
          formData.append(`items[${index}][description]`, item.description);
          formData.append(`items[${index}][quantity]`, item.quantity);
          formData.append(`items[${index}][unit_price]`, item.unit_price);
        });
      } else if (key === 'attachments' && data[key]) {
        Array.from(data[key]).forEach((file) => {
          formData.append('attachments[]', file);
        });
      } else if (data[key] !== null && data[key] !== undefined) {
        formData.append(key, data[key]);
      }
    });

    const response = await api.post('/invoices', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
    return response.data;
  },

  updateInvoice: async (id, data) => {
    const formData = new FormData();
    
    Object.keys(data).forEach(key => {
      if (key === 'items') {
        data[key].forEach((item, index) => {
          formData.append(`items[${index}][description]`, item.description);
          formData.append(`items[${index}][quantity]`, item.quantity);
          formData.append(`items[${index}][unit_price]`, item.unit_price);
        });
      } else if (key === 'attachments' && data[key]) {
        Array.from(data[key]).forEach((file) => {
          formData.append('attachments[]', file);
        });
      } else if (data[key] !== null && data[key] !== undefined) {
        formData.append(key, data[key]);
      }
    });

    const response = await api.put(`/invoices/${id}`, formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
    return response.data;
  },

  deleteInvoice: async (id) => {
    const response = await api.delete(`/invoices/${id}`);
    return response.data;
  },

  getInvoicePdf: async (id) => {
    const response = await api.get(`/invoices/${id}/pdf`);
    return response.data;
  },
};

export const companyService = {
  getCompanies: async (params = {}) => {
    const response = await api.get('/companies', { params });
    return response.data;
  },

  getCompany: async (id) => {
    const response = await api.get(`/companies/${id}`);
    return response.data;
  },

  createCompany: async (data) => {
    const formData = new FormData();
    formData.append('name', data.name);
    if (data.address) {
      formData.append('address', data.address);
    }
    if (data.logo) {
      formData.append('logo', data.logo);
    }

    const response = await api.post('/companies', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
    return response.data;
  },

  updateCompany: async (id, data) => {
    const formData = new FormData();
    formData.append('name', data.name);
    if (data.address) {
      formData.append('address', data.address);
    }
    if (data.logo) {
      formData.append('logo', data.logo);
    }

    const response = await api.put(`/companies/${id}`, formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
    return response.data;
  },

  deleteCompany: async (id) => {
    const response = await api.delete(`/companies/${id}`);
    return response.data;
  },
};

export const clientService = {
  getClients: async (params = {}) => {
    const response = await api.get('/clients', { params });
    return response.data;
  },

  getClient: async (id) => {
    const response = await api.get(`/clients/${id}`);
    return response.data;
  },

  getCompaniesByClient: async (clientId) => {
    const response = await api.get(`/clients/${clientId}/companies`);
    return response.data;
  },

  createClient: async (data) => {
    const response = await api.post('/clients', data);
    return response.data;
  },

  updateClient: async (id, data) => {
    const response = await api.put(`/clients/${id}`, data);
    return response.data;
  },

  deleteClient: async (id) => {
    const response = await api.delete(`/clients/${id}`);
    return response.data;
  },
};

export default api;

