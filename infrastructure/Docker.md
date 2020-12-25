# Docker

 - Docker
 - docker-compose

## 構成

 - Rails + Vueを乗せるアプリケーションコンテナ
 - MySQLを乗せる（後でRDSとかに置き換える）データベースコンテナ
 - Nginxのプロキシコンテナ

docker-compose.ymlに書いている環境変数は開発用で、本番用の値はAWSのパラメータストアとかで管理することになる。後述。
## バックエンドコンテナ

 - ruby:2.6.6-alpine

## フロントエンドコンテナ

どうせ二箇所にルーティング書くことになるならWebpackでVueやる旨味もあんまり無いのでは？　別コンテナにした方が楽では？　という思考を起こしてこういう構成にしましたが、このときCSRF対策についての考えが漏れていたため後でちょっと悔やみました。まだまだ詰めが甘い。  
昔の、CLI化する前のAngularが好きでした。jQueryを避けようとしただけでyarnとかnpmと付き合う羽目になるのあまりにもめんどい……javascript風情が……
## データベースコンテナ

 - mysql:5.7.31

```
  volumes:
    - ./containers/mysql_data:/var/lib/mysql
```

データの永続化のためにボリュームをマウントしている。  
containers/mysql_data下にはMySQLのスキーマやデータが含まれている。  
必要な場合（複数人でデータを共有して開発を行う場合など？）はgit管理に乗せるのだと思うが、今回はいらないので.gitignoreに `containers/mysql_data/**/*` を追加している。

## プロキシコンテナ

ポート80(http)と443(https)からのアクセスはここにつながり、ここからアプリケーションコンテナのRailsを呼び出すことになる。  
接続のためのproxy_passとかを記載した&&環境変数を埋め込んだ設定ファイルをdocker-compose.yml内でコンテナのnginx.confに上書きしている。

```
envsubst '$$NGINX_SERVER_NAME $$NGINX_SERVER_PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
```