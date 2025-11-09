import React from 'react';
import './ConfirmDialog.css';

const ConfirmDialog = ({ isOpen, onClose, onConfirm, title, message }) => {
  if (!isOpen) return null;

  return (
    <div className="confirm-dialog-overlay" onClick={onClose}>
      <div className="confirm-dialog" onClick={(e) => e.stopPropagation()}>
        <div className="confirm-dialog-header">
          <h3>{title || 'Confirm Delete'}</h3>
        </div>
        <div className="confirm-dialog-body">
          <p>{message || 'Are you sure you want to delete this item?'}</p>
        </div>
        <div className="confirm-dialog-footer">
          <button onClick={onClose} className="btn-cancel">
            Cancel
          </button>
          <button onClick={onConfirm} className="btn-confirm">
            Delete
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmDialog;

