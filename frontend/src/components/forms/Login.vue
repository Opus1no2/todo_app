<template>
  <form class="form" @submit.prevent="login">
    <div class="input-group">
      <input class='input' placeholder="Email: user@gmail.com" type="email" v-model="email">
    </div>
    <div class="input-group">
      <input class='input' placeholder="password" type="password" v-model="password">
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
      if (!this.email || !this.password) return;

      fromAuth.signIn(this.email, this.password)
        .then((response) => {
          if ('access-token' in response.headers) {
            this.$router.push('dashboard');
          }
        }).catch((err) => {
          this.$root.$emit('login-failure', err);
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.btn {
  color: white;
  width: 100%;
  background: #286794;
  border: solid #9c9c9c 1px;
  border-radius: 0;
}

.input-group .input{
  width: 100%;
  border-radius: 0;
}
</style>
