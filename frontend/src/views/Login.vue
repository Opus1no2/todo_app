<template>
  <div class='login-cont'>
    <Header></Header>
    <div class='container'>
      <Login></Login>
    </div>
  </div>
</template>

<script>
import * as fromAuth from '@/api/auth';
import Header from '@/components/Header.vue';
import Login from '@/components/forms/Login.vue';

export default {
  data() {
    return {
      email: '',
      password: '',
    };
  },
  components: {
    Header,
    Login,
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
.login-cont {
  height: 100vh;
  width: 100%;
  background: url('~@/assets/images/wood.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  position: fixed;
}
</style>
