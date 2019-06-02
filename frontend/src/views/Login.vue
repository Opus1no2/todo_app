<template>
  <div>
    <Header></Header>
    <div class="cont">
      <div class="pane">
        <Login></Login>
      </div>
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
  .btn {
    color: white;
    width: 100%;
    background: #026bb5;
    border: none;
  }

  .cont {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .pane {
    width: 80%;
  }
</style>
