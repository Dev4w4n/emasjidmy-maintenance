import React, { useEffect } from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  const getSubdomain = () => {
    const parts = window.location.hostname.split('.')
    if (parts.length >= 3) {
      return parts[0]
    }
    return null
  }
  
  const subdomain = getSubdomain()
  const dynamicSubdomain = subdomain === 'localhost' ? 'demo' : subdomain

  useEffect(() => {
    const currentPath = window.location.pathname;
    if (currentPath === '/' || currentPath === '') {
      setTimeout(() => {
        window.location.href = `https://${dynamicSubdomain}.e-masjid.my/web`;
      }, 1000);
    }
  }, [dynamicSubdomain]);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          {window.location.pathname === '/' || window.location.pathname === '' ? (
            'Selamat datang'
          ) : (
            '404 - Not found'
          )}
        </p>
      </header>
    </div>
  );
}

export default App;
