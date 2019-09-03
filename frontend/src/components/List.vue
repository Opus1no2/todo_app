<template>
  <div class='list-cont container'>
    <input
      v-model='newTodo'
      @keyup.enter ='createNew'
      @blur='createNew'
      class='item-input'
      placeholder='new item'>

    <div v-for='todo in todos' :key='todo.id'>
      <ListItem
        :todo='todo'
        :listID='listID'
        :hide='hideCompleted'>
      </ListItem>
    </div>
  </div>
</template>

<script>
import * as fromList from '@/api/list';
import * as fromTodo from '@/api/todo';
import ListItem from '@/components/ListItem.vue';

export default {
  name: 'List',
  props: ['todos', 'listID', 'hideCompleted'],
  components: {
    ListItem,
  },
  data() {
    return {
      newTodo: '',
      isComplete: false,
    };
  },
  methods: {
    createNew() {
      if (this.newTodo.trim() === '') return;

      fromTodo.createItem(this.listID, this.newTodo)
        .then((item) => {
          this.todos.unshift(item.data);
          this.$root.$emit('list-progress', this.percentCompleted);
        }).then(() => {
          this.newTodo = '';
        });
    },
  },
  computed: {
    percentCompleted() {
      const completed = this.todos.filter(todo => todo.completed_at);
      return completed.length / this.todos.length * 100;
    },
  },
  beforeUpdate() {
    this.$root.$emit('list-progress', this.percentCompleted);
  },
  mounted() {
    this.$root.$on('completed-item', (todo) => {
      const todos = [...this.todos];

      todos.forEach((t, i) => {
        if (t.id === todo.id) {
          this.todos.splice(i, 1, todo);
        }
      });
      this.$root.$emit('list-progress', this.percentCompleted);
    });
  },
};
</script>

<style lang='scss'>
.list-cont {
  text-align: center;
  color: black;
}

.item-input {
  border: none;
  background: white;
  width: 100%;
  line-height: 40px;
  font-size: 23px;
  text-align: center;
}
</style>
