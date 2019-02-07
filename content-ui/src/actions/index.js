import _ from 'lodash';
import axios from 'axios';
import {
  CONTENTS
} from './types';

const ROOT_URL = 'http://localhost:3000';

export function getAllContents() {
  return function(dispatch, getState) {
    return axios.get(`${ROOT_URL}/api/v1/contents`,{})
      .then(response => {
        dispatch({ type: CONTENTS, payload: _.get(response, 'data') });
      })
      .catch(error => {
        console.log(error.message);
      });
  }
}