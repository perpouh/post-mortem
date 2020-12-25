(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{427:function(t,a,e){"use strict";e.r(a);var s=e(53),n=Object(s.a)({},(function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[e("h1",{attrs:{id:"github-actionsで毎週gemをupdateする"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#github-actionsで毎週gemをupdateする"}},[t._v("#")]),t._v(" Github Actionsで毎週gemをupdateする")]),t._v(" "),e("p",[e("a",{attrs:{href:"https://www.slideshare.net/sinsoku/gem-122656455",target:"_blank",rel:"noopener noreferrer"}},[t._v("毎日gemをアップグレードする生活 - slideshare"),e("OutboundLink")],1),e("br"),t._v("\nこちらの記事に感銘を受けたので真似してみることにしました。")]),t._v(" "),e("p",[t._v("とはいえ業務の合間の個人開発で毎日gemを更新して確認するのはつらいので週一回にします。")]),t._v(" "),e("p",[t._v("ブランチ作成→"),e("code",[t._v("bundle update")]),t._v("→"),e("code",[t._v("git add Gemfile.lock")]),t._v("→"),e("code",[t._v("git commit")]),t._v("→"),e("code",[t._v("git push 新しいブランチ")]),t._v("→プルリクエスト作成まで。プルリクエストをフックに自動テストを流すのは別のブランチでも同じなので別のActionを作ってそっちでやります。")]),t._v(" "),e("h2",{attrs:{id:"日付をブランチ名に入れて新しいブランチを作成する"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#日付をブランチ名に入れて新しいブランチを作成する"}},[t._v("#")]),t._v(" 日付をブランチ名に入れて新しいブランチを作成する")]),t._v(" "),e("div",{staticClass:"language-yaml extra-class"},[e("pre",{pre:!0,attrs:{class:"language-yaml"}},[e("code",[t._v("  "),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("-")]),t._v(" "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("name")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" Create new Branch\n    "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("env")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n      "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("TZ")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" "),e("span",{pre:!0,attrs:{class:"token string"}},[t._v('"Asia/Tokyo"')]),t._v("\n      "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("GITHUB_TOKEN")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" $"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("{")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("{")]),t._v(" secrets.GITHUB_TOKEN "),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("}")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("}")]),t._v("\n    "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("run")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" "),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("|")]),e("span",{pre:!0,attrs:{class:"token scalar string"}},[t._v('\n      DATE=`date +"%Y%m%d"`\n      BRANCH_NAME="feature/gem-upgrade_$DATE"\n      git checkout -b "$BRANCH_NAME"')]),t._v("\n")])])]),e("p",[t._v("動作確認のため、トリガーを"),e("code",[t._v("on-push")]),t._v("にしています。")]),t._v(" "),e("div",{staticClass:"language- extra-class"},[e("pre",{pre:!0,attrs:{class:"language-text"}},[e("code",[t._v("on:\n  push:\n    branches:\n    - feature/github_ci\n")])])]),e("p",[t._v("本当はローカルにも"),e("a",{attrs:{href:"https://github.com/nektos/act",target:"_blank",rel:"noopener noreferrer"}},[t._v("act"),e("OutboundLink")],1),t._v("とか入れて動かしてたんですが、なんかどうもローカルとActionsで挙動が違う（ローカルだと「gitコマンドが無い」と言われる、Actionsでは動く）のでどっか設定ミスってるっぽい。"),e("br"),t._v("\n面倒なのでいちいちプッシュして確認しました。設定作業はつまらないので嫌です。")]),t._v(" "),e("h2",{attrs:{id:"github-actionsを定時実行する"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#github-actionsを定時実行する"}},[t._v("#")]),t._v(" Github Actionsを定時実行する")]),t._v(" "),e("p",[e("a",{attrs:{href:"https://gotohayato.com/content/514/",target:"_blank",rel:"noopener noreferrer"}},[t._v("GitHub Actions ワークフローで処理を定期実行する方法"),e("OutboundLink")],1)]),t._v(" "),e("p",[t._v("ぴったりの記事がありました。やったね。")]),t._v(" "),e("div",{staticClass:"language-yaml extra-class"},[e("pre",{pre:!0,attrs:{class:"language-yaml"}},[e("code",[e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("on")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" \n  "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("schedule")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n   "),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("-")]),t._v(" "),e("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("cron")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" 0 4 * * 6\n")])])]),e("p",[t._v("cronの設定は何回やっても忘れるのでこちらを参考にしました:"),e("a",{attrs:{href:"https://crontab.guru/",target:"_blank",rel:"noopener noreferrer"}},[t._v("crontab.guru"),e("OutboundLink")],1),e("br"),t._v("\n世の中には便利なサイトがいっぱいあるなあ。")]),t._v(" "),e("p",[t._v("一応これで毎週土曜日の午前四時にこの"),e("code",[t._v("gem update")]),t._v("その他が動くはずです。まだ書いてから土曜が来ていないのでわかりません。動くといいな。")]),t._v(" "),e("h2",{attrs:{id:"bundler-diff"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#bundler-diff"}},[t._v("#")]),t._v(" bundler-diff")]),t._v(" "),e("p",[t._v("これ大本命だったのですが、動かしてみたところ、今回のフォルダ構成には合わないっぽかったので断念しました。"),e("br"),t._v("\n動かしてみたら「"),e("code",[t._v(".git")]),t._v("フォルダが無いよ！」と言われたので、おそらく"),e("code",[t._v(".git")]),t._v("フォルダと "),e("code",[t._v("bundle")]),t._v(" コマンドの位置が合ってないのが悪いのだと思う。"),e("a",{attrs:{href:"https://github.com/perpouh/post-mortem/commit/bfe08470153d3386f72a50b3333dddaa0d6bce54",target:"_blank",rel:"noopener noreferrer"}},[t._v("あのとき"),e("OutboundLink")],1),t._v("Railsにwebpackでvueを入れていればこんなことには……orz"),e("br"),t._v("\nまあいいや。次回。")]),t._v(" "),e("p",[t._v("githubリポジトリ: "),e("a",{attrs:{href:"https://github.com/sinsoku/bundler-diff/tree/master/examples",target:"_blank",rel:"noopener noreferrer"}},[t._v("sinsoku/bundler-diff"),e("OutboundLink")],1)])])}),[],!1,null,null,null);a.default=n.exports}}]);