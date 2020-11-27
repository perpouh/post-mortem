# rack-corsを導入する

## インストール

```
% gem install rack-cors
```

以上  
詳しくは公式リポジトリのREADMEに書いてあります→[cyu/rack-cors](https://github.com/cyu/rack-cors)

## 設定

[/server/config/initializers/cors.rb](https://github.com/perpouh/post-mortem/blob/master/server/config/initializers/cors.rb)

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['CLIENT_HOST'] # ← '*'のままにしない！
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

`ENV['CLIENT_HOST]` にはDockerfileで設定したものが入ってきます。  
これでVue側からのリクエストをRailsで受けられるようになりました。

// TODO: localhost以外からのリクエストを弾いてくれているかはローカルだと確認しづらいので、どっかにデプロイしてから確認しようと思います。

## そもそもCORSとは？

>現在のWebブラウザでは、標準で同一生成元ポリシーという情報の悪用の防止策が適用されています。同一生成元ポリシーはオリジン つまりスキーム(http://, https:// など)、ホスト(example.com)、ポート(80,443)の組み合わせが全て一緒でないと情報は共有しませんというポリシーのことです。

引用元: [Access-Control-Allow-Origin*はどれほど脆弱なのか|脆弱なCORS設定の被害と対策を考える - @Virtual](https://at-virtual.net/securecoding/access-control-allow-origin%E3%81%AF%E3%81%A9%E3%82%8C%E3%81%BB%E3%81%A9%E8%84%86%E5%BC%B1%E3%81%AA%E3%81%AE%E3%81%8B%E8%84%86%E5%BC%B1%E3%81%AAcors%E8%A8%AD%E5%AE%9A%E3%81%97%E3%81%A6/)

※ 引用と言っておきながらホストのところを `example.com` に書き換えています。安全のための措置です。  
※ `example.com` は開発のためにRFCによって予約されているドメインです。詳しくは検索。

要するにCORSはセキュリティのための機能なんですが、開発をやっているとちょいちょい面倒になる機能でもあります。今回みたいにフロントとバックエンドのポートが別のケースとか。  
上でも書いたし上記のリンクにも書いてあるのですが、`origin` は `'*'` にしてはいけません。ファイアウォールをoffにするタイプの愚行です（それも開発環境だとやりがちだけど）

まあそれはそれとして「ローカルホスト同士の通信くらい良しとしてくれよめんどくせえ」と思ってはいる。