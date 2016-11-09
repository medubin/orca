//React
import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, browserHistory } from 'react-router';

//Components
import App from './components/app.jsx';
import Root from './components/root.jsx';
import Store from './store/store';

document.addEventListener("DOMContentLoaded", function() {
  let store = Store();
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, root);
});
