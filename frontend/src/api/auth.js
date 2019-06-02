export function signIn(email, password) {
  return fetch('http://localhost:3000/api/v1/auth/sign_in', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ email: email,  password: password }),
  });
}
