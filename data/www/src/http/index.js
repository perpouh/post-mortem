// import _Vue from 'vue';
import axios from 'axios';

export default {
  install(Vue) {
    const http = axios.create({
      // URL は環境変数とかで変えられるにする
      baseURL: process.env.VUE_APP_API_ENDPOINT,
      timeout: 10000,
    });
    http.interceptors.request.use((config) => {
      // $stores.auth.show に認証情報が入っているとする
      config.headers = Vue.prototype.$stores.getters["auth/show"];
      return config;
    });
    Vue.prototype.$http = http;
  }
}