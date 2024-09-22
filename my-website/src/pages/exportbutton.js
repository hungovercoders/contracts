import React from 'react';

// Modify ExportButton to accept dynamic fileUrl and fileName as props
function ExportButton({ fileUrl, fileName }) {
  const downloadYaml = () => {
    const link = document.createElement('a');
    link.href = fileUrl;
    link.download = fileName;
    link.click();
  };

  return (
    <button onClick={downloadYaml} style={buttonStyle}>
      Export YAML
    </button>
  );
}

const buttonStyle = {
  padding: '10px 20px',
  backgroundColor: '#007BFF',
  color: '#fff',
  border: 'none',
  borderRadius: '5px',
  cursor: 'pointer',
  marginBottom: '20px',
};

export default ExportButton;
