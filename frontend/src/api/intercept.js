import axios from 'axios';
import router from '@/router';

let client = null;
let accessToken = null;
let uid = null;

const STORE_KEY = '_todo_auth_';

axios.defaults.baseURL = 'http://localhost:3000';
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['token-type'] = 'Bearer';

axios.interceptors.request.use((config) => {
  if (accessToken) {
    config.headers.common['access-token'] = accessToken;
    config.headers.common['client'] = client;
    config.headers.common['uid'] = uid;
  }

  const fromStorage = JSON.parse(localStorage.getItem(STORE_KEY));

  if (fromStorage && fromStorage.accessToken) {
    config.headers.common['access-token'] = fromStorage.accessToken;
    config.headers.common['client'] = fromStorage.client;
    config.headers.common['uid'] = fromStorage.uid;
  }

  return config;
}, (err) => {
  return Promise.reject(err);
});

axios.interceptors.response.use((response) => {
  accessToken = response.headers['access-token'];
  client = response.headers['client'];
  uid = response.headers['uid'];

  if (accessToken) {
    localStorage.setItem(STORE_KEY, JSON.stringify({client, accessToken, uid}));
  }

  return response;
}, (err) => {
  router.push('/');
  return Promise.reject(err);
});
