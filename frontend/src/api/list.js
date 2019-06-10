import './intercept';
import axios from 'axios';

export function lists() {
  return axios('/v1/list');
}

export function completeItem(list_id, todo) {
  return axios.put(`/v1/list/${list_id}/todo/${todo.id}`);
}
