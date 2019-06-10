<template>
  <form class="form" @submit.prevent="login">
    <div class="input-group">
      <input class='input' placeholder="Email: user@gmail.com" type="email" v-model="email">
    </div>
    <div class="input-group">
      <input class='input' placeholder="password" type="password" v-model="password">
    </div>
    <button class="btn" type="submit">Sign Up</button>
  </form>
</template>

<script>
export default {
  name: 'SignUp',
};
</script>
<style lang="scss">
.btn {
  color: white;
  width: 100%;
  background: #026bb5;
  border: none;
  border-radius: 0;
}
.input-group .input{
  width: 100%;
  border-radius: 0;
}
</style>
