# Docker

 - Docker
 - docker-compose

## 構成

 - Rails + Vueを乗せるアプリケーションコンテナ
 - MySQLを乗せる（後でRDSとかに置き換える）データベースコンテナ
 - Nginxのプロキシコンテナ

## アプリケーションコンテナ

 - ruby:2.6.6-alpine

> You have to install development tools first

buildが途中でコケたせいでdevツール(gccとか)が入っていなかった結果、makeコマンドとかでエラーが出て立ち上がらなかった。Dockerfileを見直して修正。