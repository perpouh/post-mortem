# devise_token_auth導入と設定

以下の記事を参考に設定していきます。  
[[Rails] devise token auth を使う - Qiita](https://qiita.com/Masahiro_T/items/6bc49a625b437a7c2f45)

 1. Gemfileに `devise_token_auth` を追加
 2. bundle install
 3. rails g devise_token_auth:install User auth  

>次に、インストール時に作成されたdb/migrate/~_devise_token_auth_create_users.rbにTrackableに関するカラムを追記します。
>これがないと、サインイン時にUndefined method current_sign_in_at（current_sign_in_atはTrackableに関するカラム）とエラーが出ます。

```rb
  # ここを追記 --------------------------------------------
  ## Trackable
  t.integer  :sign_in_count, default: 0, null: false
  t.datetime :current_sign_in_at
  t.datetime :last_sign_in_at
  t.string   :current_sign_in_ip
  t.string   :last_sign_in_ip
  # -----------------------------------------------------
```

devise_token_authの設定(config/initializers/devise_token_auth.rb)は私はほぼそのままです。  
`config.change_headers_on_each_request` をアンコメントしてfalseに変更し、 `config.default_confirm_success_url` を追記しました。curlで動かしたときにwarningが出た（んだった気がする）ため。

4. application_controllerに以下を記述  
   `include DeviseTokenAuth::Concerns::SetUserByToken`
5. user.rbに以下を記述  
   `include DeviseTokenAuth::Concerns::User`

ここまででcurlでの動作確認ができました。作業コミットはここ:[09cbeab4a3b0cdcf06a26942e33e946db06b89ec](https://github.com/perpouh/post-mortem/pull/3/commits/09cbeab4a3b0cdcf06a26942e33e946db06b89ec)

## rails_corsの設定を追加

これでよしと思ったらVueからajaxでつないだときにヘッダが取得できませんでした。curlでつないだときには以下のように出力されていたのですが、この内のほとんどが見えない状態でした。

```
% curl localhost:3030/auth/sign_in -X POST -d '{"email":"mail@example.com", "password":"password"}' -H "content-type:application/json" -i
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
access-token: MpVFdSiHYkXOPJ2cd53iMw ←これと
token-type: Bearer
client: ZxKHfcwDceyBV0oL_2NNHQ ←これと
expiry: 1609136308
uid: mail@example.com ←これが必要
ETag: W/"e22bae0c2e6294167626665a9858ea03"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3a87fc8f-7b87-4b07-8a90-cd5e7194ccdf
X-Runtime: 0.465371
Vary: Origin
Transfer-Encoding: chunked

{"data":{"id":1,"email":"mail@example.com","provider":"email","uid":"mail@example.com","allow_password_change":false,"username":null,"nickname":null,"image":null,"ticket_count":0,"comment_count":0}}
```

ざっと検索してみたところ、以下の記事がヒットしました。

[Axiosでレスポンスヘッダが取得できなかった (CORSなAPI) - キリウ君が読まないノート](https://note.kiriukun.com/entry/20200303-axios-response-header-could-not-get)  
>どうやらCORSなWebAPIの場合、ブラウザ側で扱えるレスポンスヘッダの名称を、Access-Control-Expose-Headers ヘッダで明示的に指定する必要があるようです。
>Cache-Control とか Content-Type のような一般的なレスポンスヘッダならば不要みたいですが、今回は自分で定義したレスポンスヘッダなので必要でした。

CORSについてはrails_corsを導入しましたので、検索→[RailsでCORSのAccess-Control-Expose-Headersを設定する - Qiita](https://qiita.com/owlgae/items/a6e5ec7f0cdf89365e8c)がヒット、以下のように書き換えたところ、無事に必要な情報を取得することができました。

```diff
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['CLIENT_HOST']
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
+     expose: ['access-token', 'client', 'uid']
  end
end
```

これでVueからの疎通を確認できました。  
全体PRはこれ:[Feature/vuex #3](https://github.com/perpouh/post-mortem/pull/3)