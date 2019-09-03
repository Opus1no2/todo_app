<template>
  <div class='list-item'
    v-bind:class='{ completed: todo.completed_at, hide: hide && todo.completed_at }' >
    <button class='delete-btn' v-on:click='deleteTodo(todo)'>X</button>
    <input class='todo-input' :value=todo.name :readonly='todo.completed_at'>
    <label class='custom-checkbox' :for=todo.id>
      <input
      v-on:change='complete(todo)'
      v-bind:id='todo.id'
      type='checkbox'>
      <div class='circle'></div>
    </label>
  </div>
</template>

<script>
import * as fromList from '@/api/list';
import * as fromTodo from '@/api/todo';

export default {
  props: ['todo', 'listID', 'hide'],
  methods: {
    complete(todo) {
      fromList.completeItem(this.listID, todo.id)
        .then((t) => {
          this.$root.$emit('completed-item', t.data);
        });
    },
    deleteTodo(todo) {
      fromTodo.deleteItem(this.listID, todo.id).then((resp) => {
        const removedTodo = resp.data;
        this.$root.$emit('destroyed-item', removedTodo);
      });
    },
  },
};
</script>

<style lang='scss'>
.custom-checkbox {
  width: 75px;
  height: 42px;
  line-height: 40px;
  border-radius: 0;
  border-left: solid 1px #bbbbbb;
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
  background: #777777;

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
  align-items: center;
  margin-bottom: 10px;
  background: #ffffffcc;
  border: solid 1px #777777;

  input {
    padding-left: 25px;
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

.delete-btn {
  margin: 0;
  flex: 1;
  height: 42px;
  border: none;
  border-radius: 0;
  border-right: solid 1px black;
  padding-left: 15px;
  padding-right: 15px;
  background: #4a4a4a;
  font-weight: bold;
  color: white;
}
</style>
