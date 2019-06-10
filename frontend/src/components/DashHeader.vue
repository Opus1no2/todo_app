<template>
  <header class="dash-header">
    <div class='container'>
      <button class='white-btn' v-on:click='logOut'>Log out</button>
      <button class='white-btn' v-on:click='toggleComplete'>Toggle Completed</button>
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

<style lang="scss">
.white-btn {
  background: white;
  float: right;
  border-radius: 0;
  margin-bottom: 0;
  margin-left: 10px;
}

.dash-header {
  background: #4a4a4a;
  border-bottom: solid 1px #2f2f2f;
  min-height: 60px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
</style>
