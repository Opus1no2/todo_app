<template>
  <progress class='list-progress' v-bind:value='percentage' max='100'></progress>
</template>

<script>
export default {
  name: 'Progress',
  data() {
    return {
      percentage: 0,
    };
  },
  mounted() {
    this.$root.$on('list-progress', (percentage) => {
      this.percentage = percentage;
    });
  },
};
</script>

<style lang='scss'>
progress[value]::-webkit-progress-bar {
  background: white;
}

progress[value]::-webkit-progress-value {
  background: #45af5e;
}

progress[value] {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;

  vertical-align: 12px;
  height: 5px;
  border: none;
  width: 100%;
}

</style>
