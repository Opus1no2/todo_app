<template>
  <div class='login-cont'>
    <Header></Header>
    <div class='container'>
      <div v-if='error' class='auth-error'>
        Your username or password was incorrect.
      </div>
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
      error: false,
    };
  },
  components: {
    Header,
    Login,
  },
  mounted() {
    this.$root.$on('login-failure', () => {
      this.error = true;
    });
  },
};
</script>

<style lang="scss">
.auth-error {
  background: #ff7777;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
  font-size: 18px;
  height: 40px;
}

.login-cont {
  height: 100vh;
  width: 100%;
  background: url('~@/assets/images/wood.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  position: fixed;
}
</style>
