import React from 'react';
import { Provider } from 'react-redux';

//React Router
import { Router, Route, hashHistory } from 'react-router';
import App from './app';

const Root = ({ store }) => {
  return (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
      </Route>
    </Router>
  </Provider>
);
};

export default Root;
