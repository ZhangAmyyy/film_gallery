import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { Provider } from 'react-redux';
import * as Sentry from '@sentry/browser';
import './index.scss';
import App from './App';
import store from './redux/store';

Sentry.init({
  dsn: process.env.REACT_APP_SENTRY_DSN,
  beforeBreadcrumb(breadcrumb, hint) {
    return breadcrumb.category === 'ui.click' ? null : breadcrumb;
  }
});

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </StrictMode>
);
