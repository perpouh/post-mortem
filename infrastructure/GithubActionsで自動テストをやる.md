# Github Actionsで自動テストをやる

プルリクエストが作成されたら→rubocopとrspecを走らせる。

rubocopは正直pre-commit辺りに仕込んでもいいのだけどpre-commitは共有されないから厳しい。  
今回プロジェクトは私一人なので考える必要無いんですけどね。

[GitHooksのpre-pushを共有してレポジトリを健全に保つ - Tatsuya Asami - Medium](https://medium.com/@astatsuya/7156def39b64)

## 大まかな流れ

1. `feature/gem-upgrade_YYMMDD`ブランチを作成する
2. `bundle update`を実行する
3. コミット、プッシュ
4. PRを作成する
   1. PRを作成したらPRをフックにしている自動テストが走る（予定）
   2. →workflowをhookにworkflowは動いてくれないようだったのでhookを追加
5. 手動でマージし、ブランチを削除

手動の作業が残っているのは気分的に一応目視確認したかっただけです。誤字脱字とかログの削除漏れとかはなぜかプッシュしてからブラウザで見た方が発見率が高い（当社比）ので。

## 実際のコード

```yaml
on:
  pull_request:
    branches: [ master ]
  workflow_run:
    workflows:
      - scheduled_gem_update
    branches:
      - 'feature/gem-upgrade_**'
    types:
      - completed
```

前半はPRが作成されたときのためのもの、後半は自動で `bundle update` したときのためのものです。現在はmasterブランチに対してPR送るときのみ自動テストにしていますが、そのうちdevelopブランチを生やしたらそっちにも仕掛ける予定です。

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up Ruby
      uses: ruby/setup-ruby@21351ecc0a7c196081abca5dc55b08f085efe09a
      with:
        ruby-version: 2.6
      env:
        ImageOS: ubuntu18
    - name: Install dependencies
      run: |
        cd server
        bundle install
    - name: Run rubocop
      run: |
        cd server
        bundle exec rubocop
    - name: Run tests
      env:
        RAILS_ENV: test
        DB_USER: root
        DB_PASSWORD: root
        DB_HOST: localhost
        DB_DATABASE: post-mortem_test
        CLIENT_HOST: www.example.com
      run: |
        sudo /etc/init.d/mysql start
        cd server
        bundle exec rails db:create
        bundle exec rails db:migrate
        bundle exec rspec
```

`cd server` とかはそうしないとコマンドの実行場所がおかしかったので不承不承で書いたものです。なんか美しくないから嫌なんだけど、こういうものかしら。

`Run tests` jobのenvについて。  
ソースを変えずに環境変数だけ変えてローカルもテストも本番も動くようにしたかったので、`database.yml` は以下のようになっています。

```yaml
default: &default
  adapter: mysql2
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
  charset: utf8mb4
  encoding: utf8mb4
  collation: utf8mb4_general_ci
  username: <%= ENV['DB_USER'] %>
  password: <%= ENV['DB_PASSWORD'] %>
  database: <%= ENV['DB_DATABASE'] %>
  host: <%= ENV['DB_HOST'] %>
```

この `<%= ENV['hoge'] %>` のところに、例えばdocker-composeの設定値だとか、ワークフローの設定値だとか、パラメータストアの設定値が入ってきます。

## テストはテストの設定で動くようにする

これが何かって言うと、開発環境とは別にテスト環境を作りたいという話です。どっちも仮想ですけど。  
testの方はテストが終わったらすべてのデータが削除され、毎回必ずまっさらの状態からのテストになります。対する開発環境は、いちいちユーザーデータとか消えたらかったるいどころではないので、永続化します。

GithubActionsおよびコンソールの `docker-compose run --rm server rspec` コマンドで動くのはtestの設定。`docker-compose up` で動くのはdevelopになるようにします。  
とはいえ `rails_helper.rb` に`ENV['RAILS_ENV'] = 'test'`と書いて無理やりtestで動かしてるだけです。問題が起きたらそれはその時。