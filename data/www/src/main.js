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

require('@/assets/sass/application.scss')

/* font awesome */
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCommentAlt, faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faCommentAlt)
library.add(faThumbsUp)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.prototype.$http = Http
Vue.use(Toasted)
Vue.use(Loading)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  // store,
  components: { App },
  template: '<App/>'
})