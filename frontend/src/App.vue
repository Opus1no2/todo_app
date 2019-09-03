<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang='scss'>
@import '../src/assets/styles/skeleton.css';

body {
  margin: 0;
  background: #151515;
}

h1, h2, h3, h4, h5, h6 {
  margin-bottom: 0;
}

a {
  text-decoration: none;
  color: white;
}

.container,
.row {
  &:after {
    content: none;
  }
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: white;
}
</style>
