<template>
  <form class="form" @submit.prevent="signUp">
    <div class="input-group">
      <input class='input' placeholder="Email: user@gmail.com" type="email" v-model="email">
    </div>
    <div class="input-group">
      <input class='input' placeholder="password" type="password" v-model="password">
    </div>
    <button class="btn" type="submit">Sign Up</button>
  </form>
</template>

<script>
import * as fromAuth from '@/api/auth';

export default {
  name: 'SignUp',
  data() {
    return {
      email: '',
      password: '',
    };
  },
  methods: {
    signUp() {
      fromAuth
        .signUp(this.email, this.password).then(() => {
          return fromAuth.signIn(this.email, this.password);
        }).then((response) => {
          if ('access-token' in response.headers) {
            this.$router.push('dashboard');
          }
        }).catch(() => {
          this.$router.push('/');
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
