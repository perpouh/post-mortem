# axiosとVuexを使ったログインロジックの作成

承前:[devise_token_auth導入と設定](/post-mortem/rails/devise_token_auth導入と設定)

Rails側の設定が終わったので、VueとVuexを使って認証をやっていきます。

 1. 画面からメールアドレスとパスワードを入力して送信
 2. Railsからの戻り値をVuexに保存
 3. その後はVuexに入っている認証情報をリクエストヘッダに含めてRailsとやり取りする

という挙動になる予定です。

## Railsからの戻り値をVuexに保存

`Signin.vue`

```javascript
  methods: {
    ...mapMutations('auth',[ // ←これと
      'login'
    ]),
    signin() {
      let loader = this.$loading.show();
      this.$http.post(`/auth/sign_in`, {email: this.email, password: this.password})
      .then(function(res){
        this.login(res.headers) // ←これ
        this.$toasted.global.success()
        this.$router.push('/')
      }.bind(this))
      .catch(function (error) {
        this.$toasted.global.error()
      }.bind(this))
      .then(function(){
        loader.hide()
      })
    }
  },
```

`store/auth.js`

```javascript
  mutations: {
    login: function(state, data){
      state.access_token = data['access-token'];
      state.client = data['client'];
      state.uid = data['uid'];
    },
  }
```

## Vuexストアに入っている認証情報をリクエストヘッダに含める

### Vuexストアにgetterメソッドを作成

```javascript
  getters: {
    show: function(state){
      return {
        access_token: state.access_token,
        client: state.client,
        uid: state.uid
      }
    }
  }
```

### httpモジュールからストアの情報を読み出してリクエストヘッダに追加

axiosにリクエストヘッダを追加する際は `interceptors` を使います。

```javascript
  http.interceptors.request.use((config) => {
    config.headers = Vue.prototype.$stores.getters["auth/show"];
    return config;
  });
```

`Vue.prototype.$stores`にVuexストアを詰めているのは`main.js`

```javascript
import store from './store'
Vue.prototype.$stores = store
new Vue({
  el: '#app',
  store,
  components: { App },
  template: '<App/>'
})
```

最初はprototypeに登録したらnew Vueの方のstoreいらないのでは？と思ったのですが、消してみたらうまく情報が入らなかったので、必要なようです。仕組みを理解していない。

## vuex-persistedstate導入

Vuexストアの情報はリロードで消えてしまうので、ログイン情報を保持するためにvuex-persistedstateを導入します。

```
% yarn add vuex-persistedstate
```

そしてこう。

`store/index.js`

```javascript
import VuexPersistedstate from "vuex-persistedstate";

//...(略)...

  plugins: [
    VuexPersistedstate({
      key: 'PostMortem',
      paths: ['auth'],
      storage: window.localStorage
    }),
  ]
```

これ入れてもリロードしたら情報消えるじゃん！　なんでだ！？　と思ってしばらくハマりましたが、なんのことはない、[コンソール](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)の見方を間違えていただけでした。世の中はこともなし。

今後は`this.$http.get()`とかでリクエストを投げればOKです。Rails側では`current_user`が使えます。やったぜ。

例)参加しているプロジェクトの一覧を取得するメソッド

```ruby
class My::ProjectsController < AuthenticatedController
  def index
    @projects = Project.joining(current_user.id)
  end
end
```