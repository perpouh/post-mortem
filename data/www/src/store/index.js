import Vue from 'vue';
import Vuex from 'vuex';
import VuexPersistedstate from "vuex-persistedstate";
// import auth from './auth';
import mutations from './mutations';
import actions from './actions';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    user: null,
    // projects: [] // TODO: サイドバーとかで使うなら考える
  },
  plugins: [
    VuexPersistedstate({
        key: 'PostMortem',
        paths: [],
        storage: window.sessionStorage
    }),
    VuexPersistedstate({
      key: 'PostMortem',
      paths: ['auth'],
      storage: window.localStorage
    }),
  ],
  actions: actions,
  mutations: mutations
})