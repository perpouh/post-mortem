// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex';
import App from './App'
import router from './route'
import Http from './http'
import Toasted from 'vue-toasted'
import store from './store'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';

require('@/assets/sass/application.scss')

/* font awesome */
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCommentAlt, faThumbsUp, faBookmark, faSearch } from '@fortawesome/free-solid-svg-icons'
// import { faCommentAlt, faThumbsUp, faQuestionCircle } from '@fortawesome/pro-regular-svg-icons' # TODO
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faCommentAlt)
library.add(faThumbsUp)
library.add(faBookmark)
library.add(faSearch)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(Toasted)
Vue.use(Loading)
Vue.use(Vuex);
Vue.use(Http);
Vue.config.productionTip = false
Vue.prototype.$stores = store

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
  store,
  components: { App },
  template: '<App/>'
})