// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue/dist/vue.esm'
import App from './App'
import router from './route'
import Http from './http'
import Toasted from 'vue-toasted'
// import store from './store'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';

Vue.use(Toasted)
Vue.use(Loading)
Vue.prototype.$http = Http
Vue.config.productionTip = false

Vue.toasted.register('error', 'エラーが発生しました。', {
  type : 'error',
  // icon : 'error_outline',
  theme: "bubble", 
  position: "top-center", 
  duration : 3000
})

Vue.toasted.register('success', '保存しました。', {
  type : 'success',
  // icon : 'check_outline',
  theme: "bubble", 
  position: "top-center", 
  duration : 3000
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  // store,
  components: { App },
  template: '<App/>'
})