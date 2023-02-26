import React from 'react';
import { Provider } from 'react-redux';
import './App.css';
import store from './redux/store';

const App = () => {
  return (
    <Provider store={store}>
      <div className='app'>
        <h1>Set up React Redux</h1>
      </div>
    </Provider>
  );
};

export default App;
