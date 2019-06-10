<template>
  <header class="header">
    <div class='container'>
      <h4>Yet Another Todo Application</h4>
      <router-link to='/sign_up' class='white-btn'>Sign Up</router-link>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
};
</script>

<style lang="scss">
h4 {
  margin-bottom: 0;
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
