// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue/dist/vue.esm'
import App from './App'
import router from './route'
import Http from './http'
import Toasted from 'vue-toasted'
// import store from './store'

Vue.prototype.$http = Http
Vue.use(Toasted)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  // store,
  components: { App },
  template: '<App/>'
})