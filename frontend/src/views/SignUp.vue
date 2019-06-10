<template>
  <div class='sign-cont'>
    <Header></Header>
    <div class='container'>
      <SignUp></SignUp>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import SignUp from '@/components/forms/SignUp.vue';

export default {
  components: {
    Header,
    SignUp,
  },
};
</script>
<style>
.sign-cont {
  height: 100vh;
  width: 100%;
  background: url('~@/assets/images/wood.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  position: fixed;
}
</style>
