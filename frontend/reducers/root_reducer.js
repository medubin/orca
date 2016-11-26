import { combineReducers } from 'redux';
import SearchReducer from './search_reducer';


const RootReducer = combineReducers({
  search: SearchReducer
});

export default RootReducer;
