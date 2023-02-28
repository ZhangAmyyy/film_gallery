import React from 'react';
import { Provider } from 'react-redux';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import './App.scss';
import store from './redux/store';
import Header from './components/header/Header';
import Main from './components/main/Main';
import Details from './components/content/datails/Details';

function App() {
  return (
    <Provider store={store}>
      <Router>
        <Header />
        <div className="app">
          <Routes>
            <Route path="/" element={<Main />} />
            <Route path="/:id/:name/details" element={<Details />} />
          </Routes>
        </div>
      </Router>
    </Provider>
  );
}

export default App;
