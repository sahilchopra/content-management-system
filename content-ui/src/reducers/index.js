import { combineReducers } from 'redux';
import content from './content_reducer';

const rootReducer = combineReducers({
  content: content
});

export default rootReducer;
