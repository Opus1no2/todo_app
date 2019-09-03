import './intercept';
import axios from 'axios';

export function createItem(listID, name) {
  return axios.post(`/v1/list/${listID}/todo`, { name });
}

export function deleteItem(listID, id) {
  return axios.delete(`/v1/list/${listID}/todo/${id}`);
}
