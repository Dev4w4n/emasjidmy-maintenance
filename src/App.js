import React, { useEffect } from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  useEffect(() => {
    const redirectTimeout = setTimeout(() => {
      window.location.href = '/web';
    }, 1500);

    return () => clearTimeout(redirectTimeout); // Cleanup timeout on unmount
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Loading...</p>
      </header>
    </div>
  );
}

export default App;
