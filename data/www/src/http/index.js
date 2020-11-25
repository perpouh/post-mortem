import Axios from 'axios'
export default {
  axios: Axios.create({
    baseURL: 'http://server:3000', // バックエンドB のURL:port を指定する
    headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    },
    responseType: 'json'
  }),
  get: url => params => Axios.get(url, { params: { params } })
}