import './intercept';
import axios from 'axios';

export function createItem(list_id, name) {
  return axios.post(`/v1/list/${list_id}/todo`, { name });
}
