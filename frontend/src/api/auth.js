import './intercept';
import axios from 'axios';

export function signIn(email, password) {
  return axios.post('/v1/auth/sign_in', {
    email: email,
    password: password,
  });
}

export function logOut() {
  return axios.delete('/v1/auth/sign_out');
};
