<template>
  <header class='dash-header'>
    <div class='container header-cont'>
      <h4><router-link to='/'>AlbumPura</router-link></h4>
      <div class='mobile-icon'>
        &#9776;
      </div>
      <div class='header-items'>
        <button class='white-btn' v-on:click='logOut'>Log out</button>
        <button class='white-btn' v-on:click='toggleComplete'>Toggle Completed</button>
      </div>
    </div>
  </header>
</template>

<script>
import * as fromAuth from '@/api/auth';

export default {
  name: 'DashHeader',
  methods: {
    toggleComplete() {
      this.$root.$emit('toggleComplete');
    },
    logOut() {
      fromAuth.logOut().then((response) => {
        if (response.data.success) {
          this.$router.push('/');
        }
      });
    },
  },
};
</script>

<style lang='scss' scoped>
.white-btn {
  display: none;

  @media(min-width: 750px) {
    display: block;
    background: white;
    float: right;
    border-radius: 0;
    margin-bottom: 0;
    margin-left: 10px;
  }
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.dash-header {
  background: #4a4a4a;
  border-bottom: solid 1px #2f2f2f;
  min-height: 60px;
  display: flex;
  align-items: center;
}

.header-items {
  display: none;
}

@media(min-width: 750px) {
  .header-items {
    display: block;
  }

  .mobile-icon {
    display: none;
  }
}
</style>
