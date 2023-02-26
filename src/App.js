import React from 'react';
import { Provider } from 'react-redux';
import './App.scss';
import Header from './components/header/Header';
import store from './redux/store';

const App = () => {
  return (
    <Provider store={store}>
      <Header />
      <div className='app'>
        <h1>Set up React Redux</h1>
      </div>
    </Provider>
  );
};

export default App;
