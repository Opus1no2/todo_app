<template>
  <div>
    <DashHeader></DashHeader>
    <Progress></Progress>
    <List
      :todos='todos'
      :listID='listID'
      :hideCompleted='hideCompleted'>
    </List>
  </div>
</template>

<script>
import * as fromList from '@/api/list';
import List from '@/components/List.vue';
import DashHeader from '@/components/DashHeader.vue';
import Progress from '@/components/Progress.vue';

export default {
  data() {
    return {
      todos: [],
      listID: null,
      hideCompleted: false,
    };
  },
  components: {
    List,
    DashHeader,
    Progress,
  },
  mounted() {
    fromList.lists().then((list) => {
      this.todos = list.data.todos;
      this.listID = list.data.id;
    });

    this.$root.$on('destroyed-item', (todo) => {
      this.todos = [...this.todos].filter(t => t.id !== todo.id);
    });

    this.$root.$on('toggleComplete', () => {
      this.hideCompleted = !this.hideCompleted;
    });
  },
};
</script>

<style lang='scss'>
</style>
