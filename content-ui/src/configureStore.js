import { createStore, applyMiddleware } from 'redux';
import reducers from './reducers';
import reduxThunk from 'redux-thunk';

export const middlewares = [reduxThunk];

let createStoreWithMiddleware

createStoreWithMiddleware = createStore(reducers,applyMiddleware(...middlewares));

export default createStoreWithMiddleware;
