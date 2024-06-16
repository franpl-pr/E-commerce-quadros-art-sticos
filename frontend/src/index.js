import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import { HandleProvider } from './context/HandleContext';
import { HandleData } from './context/HandleContext';

const link_pagamento = window.link_pagamento;

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  
    <HandleProvider> 
      <HandleData>
        <App/> 
      </HandleData>
    </HandleProvider> 
  
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals