import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import { HandleProvider } from './context/HandleContext';
import { HandleDataProvider } from './context/HandleContext';
import { HandleCarrinhoProvider } from './context/HandleContext'

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  
    <HandleProvider> 
      <HandleDataProvider>
        <HandleCarrinhoProvider>
          <App/> 
        </HandleCarrinhoProvider>
      </HandleDataProvider>
    </HandleProvider> 
 
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals