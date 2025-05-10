## 事前準備

MYSQL でインターネット TV の番組表を管理するテーブル群の作成及びデータ追加の手順についてまとめています。

実行準備として、この GitHub リポジトリをローカル環境にクローンする必要があります。  
**※MYSQL はすでにインストール済みであることを想定しています。**

## 1.MYSQL に接続

ターミナルで以下のコマンドを実行し、MYSQL に接続

```
mysql -u root -p
```

## 2.root ユーザのパスワードを入力

パスワード確認画面が表示されるため、root ユーザのパスワードを入力し、MYSQL に接続。

以下の画像のように`mysql>`が表示されたら接続成功。
![接続成功画面](image.png)

# データベース構築

## 1.データベース作成

作成するデータベース名は`internet_tv`とする。
以下のように、データベース作成クエリを実行し、`internet_tv`データベースを作成。

`CREATE DATABASE <データベース名>`  
`CHARACTER SET = utf8mb4`  
`COLLATE = utf8mb4_unicode_ci;`

```
CREATE DATABASE internet_tv
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
```

## 2.使用データベースの切り替え

作成したデータベースを使用するためのクエリを実行。

```
USE internet_tv
```

## テーブル作成

テーブル設計表をもとに各テーブルの作成を行います。

mysql で下記のコマンドを実行し、同フォルダ内のテーブル作成用 SQL ファイル(create_tables_query.sql)を実行してください。（このファイルにはテーブル定義を行う CREATE TABLE 文が含まれています。）

`SOURCE <実行するファイルのパス>`

**※ファイルパスはフォルダの保存先に応じて適宜変更を行なってください。**

```
SOURCE /Users/user/Desktop/Apprentice_test/internet_tv/step2/create_tables_query.sql
```

# サンプルデータ作成

作成したテーブルにサンプルデータを追加します。

mysql で下記のコマンドを実行し、同フォルダ内のサンプルデータ追加用 SQL ファイル(insert_sampledata_query.sql)を実行してください。（このファイルにはデータを追加する INSERT 文が含まれています。）

`SOURCE <実行するファイルのパス>`

**※ファイルパスはフォルダの保存先に応じて適宜変更を行なってください。**

```
SOURCE /Users/user/Desktop/Apprentice_test/internet_tv/step2/insert_sampledata_query.sql
```
