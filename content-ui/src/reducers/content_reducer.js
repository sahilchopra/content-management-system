import {
  CONTENTS,
} from '../actions/types';

const initialState = {
  items: []
};

function initializeState(){
  return Object.assign({}, initialState);
}

export default function(state = initializeState(), action) {
  switch(action.type) {
    case CONTENTS:
      return { ...state, items: action.payload };
    default:
      return state
  }
}
