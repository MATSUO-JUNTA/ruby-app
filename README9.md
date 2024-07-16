## step9: テストデータの作成

- ブランチ名: feature9/create-seed-data

## ゴール

- アプリケーション内で使用するテストデータを作成し、投稿一覧表示機能の準備を整える

## 学習できること

- テストデータの作成方法
- シードデータの設定方法

## 実装内容

1. Postモデルを作成する
2. シードファイルの作成
3. テストデータの投入

## チェックリスト

- [ ]  Postモデルを作成する
    - Postモデルを作成するためのコマンドを実行すること
    - モデルには以下のフィールドが含まれていること
        - `title: string`
        - `body: text`
        - `user: references`
    - マイグレーションを実行
        
        ```
        docker-compose exec web rails db:migrate
        ```
        
- [ ]  シードファイルの作成
    - `db/seeds.rb` ファイルを作成し、以下の指示に従ってテストデータを追加すること
        - ダミーデータを追加すること
            - ユーザー数を5、各ユーザーの投稿数を5とすること
            - メールアドレスは`user1@example.com, user2@example.com ... user5@example.com`とすること
            - 各投稿には、下記情報を含めること（内容は下記参考にしてください）
                - タイトル：`メールアドレス`による`○番目`の投稿です
                - 本文：`メールアドレス`による`○番目`の本文です
                - 作成日時：テストデータなので現在時刻でいいです
                - 投稿者：投稿に紐付くユーザー
- [ ]  テストデータの投入
    - ターミナルでコマンドを実行し、テストデータをデータベースに投入すること
- [ ]  テストデータの確認
    - 作成したテストデータを確認するために、Railsコンソールで以下のコマンドを実行してデータを表示すること
        
        ```ruby
        rails console
        Post.all
        ```
        
    - Railsコンソールでの出力をPRに含めること