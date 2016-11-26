import { UPDATE_ORIGIN } from '../actions/search_actions'

const initialState = {
  origin: 'test'
}


const SearchReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case UPDATE_ORIGIN:
      return Object.assign({}, state, {
        origin: action.origin
      });
      default:
        return state;
  }
}

export default SearchReducer;
