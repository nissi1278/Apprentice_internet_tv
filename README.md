※MY SQL はすでにインストール済みであることを想定。
0.MYSQL ログイン
0-1.ターミナルで以下のコマンドを実施し、MYSQL に接続。(以後の作業手順では省略します。)
mysql -u root -p
0-2.パスワード確認画面が表示されるため、パスワードを入力。

1.DB 作成
1-1.DB 作成用コマンド（CREATE DATABASE）を実行し、DB 名「internet_tv」を作成。
CREATE DATABASE internet_tv;
1-2.使用する DB を切り変えるコマンドを実行してください。
USE internet_tv

2.テーブル作成

テーブル設計表をもとに使用する各テーブルを作成する。
