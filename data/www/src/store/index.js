import Vue from 'vue';
import Vuex from 'vuex';
import VuexPersistedstate from "vuex-persistedstate";
import auth from './auth';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    auth: auth,
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
  actions: {
    resetAll({commit, state}){
      Object.keys(state).forEach(key => {
        commit(key + "/reset");
      });
    }
  }
})