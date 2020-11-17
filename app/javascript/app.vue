<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
import Password from 'vue-password-strength-meter'
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    Password
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>