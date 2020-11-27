import Axios from 'axios'
const axios = Axios.create({
  baseURL: process.env.VUE_APP_API_ENDPOINT,
  headers: {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  },
  responseType: 'json'
})
export default {
  get: function (that, url, params) {
    let loader = that.$loading.show({
      container: null,
      canCancel: false,
    });
    axios.get(url, { params })
      .then(function (res) {
        console.log(res)
        loader.hide()
      })
  },
  post: function (that, url, data) {
    let loader = that.$loading.show({
      container: null,
      canCancel: false,
    });
    axios.post(url, data)
      .then(function (res) {
        console.log(res)
        that.$toasted.success(res.message, {
          theme: "bubble",
          position: "top-center",
          duration: 3000
        })
      }.bind(that))
      .catch(function (error) {
        console.log(error.response.data)
        that.$toasted.error(error.message, {
          theme: "bubble",
          position: "top-center",
          duration: 3000
        })
      }.bind(that))
      .then(function (res) {
        console.log(res)
        loader.hide()
      })
  }
}