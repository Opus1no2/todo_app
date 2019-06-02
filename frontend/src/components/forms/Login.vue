<template>
  <form class="form" @submit.prevent="login">
    <div class="input-group">
      <input placeholder="Email: user@gmail.com" type="email" v-model="email">
    </div>
    <div class="input-group">
      <input placeholder="password" type="password" v-model="password">
    </div>
    <button class="btn" type="submit">Log In</button>
  </form>
</template>

<script>
import * as fromAuth from '@/api/auth';

export default {
  name: 'Login',
  data() {
    return {
      email: '',
      password: '',
    };
  },
  methods: {
    login() {
      fromAuth.signIn(this.email, this.password)
        .then((response) => {
          if (response.headers.has('access-token')) {
            this.$router.push('dashboard');
          }
        }).catch((err) => {
          console.log('err', err);
        });
    },
  },
};
</script>

<style lang="scss">
.btn {
  color: white;
  width: 100%;
  background: #026bb5;
  border: none;
}
.input-group {
  input {
    width: 100%;
  }
}
</style>
