import { applyMiddleware } from 'redux';

//Import middleware here
//import NamedMiddleware from './named_middleware';

const RootMiddleware = applyMiddleware(
  // imported reducers go here as key (name): value (object) pairs
  //named: NamedReducer,
);

export default RootMiddleware;
