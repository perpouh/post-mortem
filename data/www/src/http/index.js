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
  get: url => params => axios.get(url, { params }),
  post: url => data => axios.post(url, data)
}