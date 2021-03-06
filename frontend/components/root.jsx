import React from 'react';
import { Provider } from 'react-redux';

// react router
import { Router, Route, IndexRoute, hashHistory } from 'react-router';

// react components
import App from './app';
import SessionFormContainer from './session_form/session_form_container';
import LandingPageContainer from './landing_page/landing_page_container'
import FlightForm from './flight_form/flight_form_container'


const Root = ({ store }) => {

  const _ensureLoggedIn = (nextState, replace) => {
    const currentUser = store.getState().session.currentUser;
    if (!currentUser) {
      replace('/login');
    }
  };

  const _redirectIfLoggedIn = (nextState, replace) => {
    const currentUser = store.getState().session.currentUser;
    if (currentUser) {
      replace('/');
    }
  };

  return (
    <Provider store={store}>
       <Router history={hashHistory}>
         <Route path="/" component={App}>
           <IndexRoute component={LandingPageContainer} />
           <Route path="/login" component={SessionFormContainer} onEnter={_redirectIfLoggedIn} />
           <Route path="/signup" component={SessionFormContainer} onEnter={_redirectIfLoggedIn} />
           <Route path="/form" component={FlightForm} onEnter={_ensureLoggedIn} />
         </Route>
       </Router>
     </Provider>
   );


}


export default Root;
