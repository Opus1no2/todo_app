<template>
  <div class='dashboard-cont'>
    <Dashboard></Dashboard>
  </div>
</template>

<script>
import Dashboard from '@/components/Dashboard.vue';

export default {
  components: {
    Dashboard,
  },
};
</script>

<style lang="scss">
  .dashboard-cont {
    height: 100vh;
    width: 100%;
    background: url('~@/assets/images/wood.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    position: fixed;
    overflow: auto;
  }
</style>
