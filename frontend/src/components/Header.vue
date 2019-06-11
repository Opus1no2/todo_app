<template>
  <header class="header">
    <div class='container'>
      <h4><router-link to='/'>Yet Another Todo Application</router-link></h4>
      <router-link to='/sign_up' class='btn'>Sign Up</router-link>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
};
</script>

<style lang="scss" scoped>
a {
  color: white;
  text-decoration: none;
}

h4 {
  margin-bottom: 0;
}

.btn {
  background: white;
  color: #2f2f2f;
  text-decoration: none;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 5px;
  padding-bottom: 5px;
}

.header {
  color: white;
  background: #2f2f2f;
  border-bottom: solid 1px #2f2f2f;
  padding: 20px;
  margin-bottom: 35px;

  .container {
    display: flex;
    justify-content: space-between;
    align-items: center;

    &:after {
      content: none;
    }
  }
}
</style>
