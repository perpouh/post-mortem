# README

いろいろやりたかったのでいろいろやっている

## フォルダ

 - client  
 フロントエンド(Vue.js)のDockerfileが入っているだけのフォルダ
 - data/www  
 フロントエンドのソースファイルが入っているフォルダ
 - nginx  
 nginxの設定ファイルが入っているフォルダ
 - server  
 Railsが入っているフォルダ

## ブランチ

 - master  
 開発を行っているブランチ  
 そのうち自動デプロイが組み込まれる予定だけどまだまだ先の話
 - doc  
 開発メモとかの.mdファイルとVuepressのソースが入っているブランチ  
 ここにpushするとGithub Actionが動いてgh-pagesに静的サイトをデプロイしてくれる
 - gh-pages  
 開発メモをGithub Pagesで表示するためのブランチ