var React = require('react');
var ReactDOM = require('react-dom');
var Router = require('react-router').Router;
var App = require('./components/app.jsx');

var Route = require('react-router').Route;



var browserHistory = require('react-router').browserHistory;

var routes = (
  <Route component={App} path = '/'>
  </Route>

);


document.addEventListener("DOMContentLoaded", function() {
  var root = document.querySelector('#content');
  ReactDOM.render(<Router history={browserHistory}>{routes}</Router>, root);
});
