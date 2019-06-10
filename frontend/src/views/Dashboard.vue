<template>
  <div class='dashboard-cont'>
    <DashHeader></DashHeader>
    <Progress></Progress>
    <List></List>
  </div>
</template>

<script>
import List from '@/components/List.vue';
import DashHeader from '@/components/DashHeader.vue';
import Progress from '@/components/Progress.vue';

export default {
  components: {
    List,
    DashHeader,
    Progress,
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
