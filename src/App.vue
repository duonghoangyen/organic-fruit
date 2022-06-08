<template>
  <div>
    <Header/>
<SileBar />
<router-view></router-view>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import SileBar from "./components/SileBar.vue";
export default {
  name: 'App',
  components: {
    Header,
    SileBar,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
