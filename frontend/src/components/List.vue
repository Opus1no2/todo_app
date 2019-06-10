<template>
  <div class='list-cont container'>
    <input
      v-model='newTodo'
      @keyup.enter ='createNew'
      @blur='createNew'
      class='item-input'
      placeholder='new item'>

    <div class='list' v-if='list'>
      <div
        v-bind:class='{ completed: todo.completed_at, hide: hideCompleted && todo.completed_at }'
        class='list-item'
        v-for='(todo, index) in todos'
        v-bind:key=todo.id>

        <input class='todo-input' v-bind:value=todo.name v-bind:readonly='todo.completed_at'>
        <label class='custom-checkbox' v-bind:for=uniqueId(todo)>
          <input
            v-on:change='complete(todo, index)'
            v-bind:id=uniqueId(todo)
            type='checkbox'>
          <div class='circle'></div>
        </label>
      </div>
    </div>
  </div>
</template>

<script>
import * as fromList from '@/api/list';
import * as fromTodo from '@/api/todo';

export default {
  name: 'List',
  data() {
    return {
      list: [],
      newTodo: '',
      isComplete: false,
      hideCompleted: true,
    };
  },
  computed: {
    todos() {
      return this.list.todos;
    },
    percentComplete() {
      if (!this.todos) return 0;
      const completed = this.todos.filter(todo => todo.completed_at);
      return completed.length / this.list.todos.length * 100;
    },
  },
  methods: {
    complete(todo, index) {
      if (todo.completed_at) return;

      fromList.completeItem(this.list.id, todo).then((t) => {
        this.todos.splice(index, 1, t.data);
        this.$root.$emit('list-progress', this.percentComplete);
      });
    },
    uniqueId(todo) {
      return `${todo.name.replace(/\s+/g, '')}${todo.id}`;
    },
    createNew() {
      if (this.newTodo.trim() === '') return;

      fromTodo.createItem(this.list.id, this.newTodo)
        .then((item) => {
          this.list.todos.push(item.data);
          this.$root.$emit('list-progress', this.percentComplete);
        }).then(() => {
          this.newTodo = '';
        });
    },
  },
  mounted() {
    fromList.lists().then((list) => {
      this.list = list.data;
      this.$root.$emit('list-progress', this.percentComplete);
    });

    this.$root.$on('toggleComplete', () => {
      this.hideCompleted = !this.hideCompleted;
    });
  },
};
</script>

<style lang='scss'>
.custom-checkbox {
  width: 75px;
  line-height: 40px;
  border-radius: 0;
  background: white;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 0;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;

  input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;

    &:checked ~ .circle {
      background: green;
    }
  }

  &:hover {
    cursor: pointer;
  }

  &:hover input:not(:completed) ~ .circle  {
    background: #0092007a;
  }
}

.hide {
  display: none !important;
}

.completed {
  color: grey;
  background: green;

  .circle {
    border: none;
    background: green;
  }

  .todo-input {
    color: grey;
  }
}

.circle {
  border: solid 1px #ccc;
  border-radius: 25px;
  height: 25px;
  width: 25px;
}

.list-cont {
  text-align: center;
  padding-top: 50px !important;
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

.list-item {
  display: flex;
  margin-bottom: 10px;
  background: #ffffffcc;

  input {
    padding-left: 50px;
    background: transparent;
    margin: 0;
    border: none;
    font-size:  23px;
    line-height: 40px;
    width: 100%;

    &:focus {
      outline: none;
      border: none;
    }
  }
}
</style>
