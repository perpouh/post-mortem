import Axios from 'axios'
const axios = Axios.create({
  baseURL: 'http://localhost:3030', // バックエンドB のURL:port を指定する
  headers: {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  },
  responseType: 'json'
})
export default {
  get: url => params => axios.get(url, { params: { params } })
}