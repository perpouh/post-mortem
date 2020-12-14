<template>
  <layout>
    <input type="email" v-model="email" placeholder="hogehoge@email.example.com">
    <input type="password" v-model="password" placeholder="passwd">
    <button @click="signin">Sign in</button>
  </layout>
</template>

<script>
import Layout from "./Layout";
import { mapActions } from 'vuex'
export default {
  data() {
    return {
        email: "",
        password: ""
    };
  },
  components: {
    Layout,
  },
  methods: {
    ...mapActions([
      'login'
    ]),
    signin() {
      let loader = this.$loading.show();
      this.$http.post(`/auth/sign_in`)({email: this.email, password: this.password})
      .then(function(res){
        this.login(res.headers)
        this.$toasted.global.success()
      }.bind(this))
      .catch(function (error) {
        this.$toasted.global.error()
      }.bind(this))
      .then(function(){
        loader.hide()
      })
    }
  },
};
</script>