# Github Actionsで毎週gemをupdateする

[毎日gemをアップグレードする生活 - slideshare](https://www.slideshare.net/sinsoku/gem-122656455)  
こちらの記事に感銘を受けたので真似してみることにしました。

とはいえ業務の合間の個人開発で毎日gemを更新して確認するのはつらいので週一回にします。

ブランチ作成→`bundle update`→`git add Gemfile.lock`→`git commit`→`git push 新しいブランチ`→プルリクエスト作成まで。プルリクエストをフックに自動テストを流すのは別のブランチでも同じなので別のActionを作ってそっちでやります。

## 日付をブランチ名に入れて新しいブランチを作成する


```yaml
  - name: Create new Branch
    env:
      TZ: "Asia/Tokyo"
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    run: |
      DATE=`date +"%Y%m%d"`
      BRANCH_NAME="feature/gem-upgrade_$DATE"
      git checkout -b "$BRANCH_NAME"
```

動作確認のため、トリガーを`on-push`にしています。

```
on:
  push:
    branches:
    - feature/github_ci
```

本当はローカルにも[act](https://github.com/nektos/act)とか入れて動かしてたんですが、なんかどうもローカルとActionsで挙動が違う（ローカルだと「gitコマンドが無い」と言われる、Actionsでは動く）のでどっか設定ミスってるっぽい。  
面倒なのでいちいちプッシュして確認しました。設定作業はつまらないので嫌です。

## Github Actionsを定時実行する

[GitHub Actions ワークフローで処理を定期実行する方法](https://gotohayato.com/content/514/)

ぴったりの記事がありました。やったね。

```yaml
on: 
  schedule:
   - cron: 0 4 * * 6
```

cronの設定は何回やっても忘れるのでこちらを参考にしました:[crontab.guru](https://crontab.guru/)  
世の中には便利なサイトがいっぱいあるなあ。

一応これで毎週土曜日の午前四時にこの`gem update`その他が動くはずです。まだ書いてから土曜が来ていないのでわかりません。動くといいな。

## bundler-diff

これ大本命だったのですが、動かしてみたところ、今回のフォルダ構成には合わないっぽかったので断念しました。  
動かしてみたら「`.git`フォルダが無いよ！」と言われたので、おそらく`.git`フォルダと `bundle` コマンドの位置が合ってないのが悪いのだと思う。[あのとき](https://github.com/perpouh/post-mortem/commit/bfe08470153d3386f72a50b3333dddaa0d6bce54)Railsにwebpackでvueを入れていればこんなことには……orz  
まあいいや。次回。

githubリポジトリ: [sinsoku/bundler-diff](https://github.com/sinsoku/bundler-diff/tree/master/examples)

