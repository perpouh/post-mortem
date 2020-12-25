# Github Actionsで自動テストをやる

プルリクエストが作成されたら→rubocopとrspecを走らせる。

rubocopは正直pre-commit辺りに仕込んでもいいのだけどpre-commitは共有されないから難しい

[GitHooksのpre-pushを共有してレポジトリを健全に保つ - Tatsuya Asami - Medium](https://medium.com/@astatsuya/7156def39b64)

# テストはテストの設定で動くようにする

これが何かって言うと、開発環境とは別にテスト環境を作りたいという話です。どっちも仮想ですけど。  
testの方はテストが終わったらすべてのデータが削除され、毎回必ずまっさらの状態からのテストになります。対する開発環境は、いちいちユーザーデータとか消えたらかったるいどころではないので、永続化します。

GithubActionsおよびコンソールの `docker-compose run --rm server rspec` コマンドで動くのはtestの設定。`docker-compose up` で動くのはdevelopになるようにします。