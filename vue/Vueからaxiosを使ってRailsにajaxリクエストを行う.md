# Vueからaxiosを使ってRailsにajaxリクエストを行う

## axiosのインストール

```
yarn add axios
```

以上

## axiosを使ったAPIリクエスト

基本的には公式に書いてあるとおりです。  
[axios を利用した API の使用 - Vue.js](https://jp.vuejs.org/v2/cookbook/using-axios-to-consume-apis.html)

```javascript
new Vue({
  el: '#app',
  data () {
    return {
      info: null
    }
  },
  mounted () {
    axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => (this.info = response))
  }
})
```

ただ毎回 `https://` から書くのは嫌だった&&後でヘッダーにCSRFトークン等を追加しなくてはならないことが薄々わかっているため、そのあたりを共通化するためにラッパークラスを作ります。

[/data/www/src/http/index.js](https://github.com/perpouh/post-mortem/blob/master/data/www/src/http/index.js)

```javascript
import Axios from 'axios'
const axios = Axios.create({
  baseURL: 'http://localhost:3030',
  headers: {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  },
  responseType: 'json'
})
export default {
  get: url => params => axios.get(url, { params: { params } })
}
```

[/data/www/src/main.js](https://github.com/perpouh/post-mortem/blob/master/data/www/src/main.js)

```javascript
import Http from './http'
Vue.prototype.$http = Http
```

これで、各コンポーネントでは `http://localhost:3030` の部分を書かなくて済むようになりました。

```javascript
fetchData () {
  this.$http.get("/projects")() // ←pathで書ける
  .then(function(res){
    this.projects = res.data
  }.bind(this))
}
```

カリー化はやってみたかっただけです。見慣れていないので目がムズムズする。

## CORS対策

→[rack-corsを導入する](/rails/rack-corsを導入する)

## baseURLを環境変数から読み込む

開発環境とテスト環境と本番環境でコードを書き換えるなんて嫌なので環境変数からbaseURLを読み込みます。

参考:[[Docker] Vueでaxiosを使うときにbaseurlを設定する方法 - Qiita](https://qiita.com/tatsumi44/items/177b3b09a8b5ce6ca971)

[/docker-compose.yml](https://github.com/perpouh/post-mortem/blob/master/docker-compose.yml)

```diff
services:
  client:
   ...
+   environment:
+      VUE_APP_API_ENDPOINT: http://localhost:3030
   ...
```

[/data/www/src/http/index.js](https://github.com/perpouh/post-mortem/blob/master/data/www/src/http/index.js)

```diff
import Axios from 'axios'
const axios = Axios.create({
- baseURL: 'http://localhost:3030',
+ baseURL: process.env.VUE_APP_API_ENDPOINT,
```

疎通を確認できました。