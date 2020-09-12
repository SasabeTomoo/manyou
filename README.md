users

|  column  |
| ---- |
|  id  |
| name  |
 |email  |
 |  password_digest  |


tasks

|  column |
| ---- |
|  id  |  
|task_name |
| content  |
|  user_id  |


labels

|  column |
| ---- |
|  id  |
| label_name |
|content  |
|user_id  |
|task_id  |

デプロイの手順について
（前提：Herokuへのログイン）
①アセットプリコンパイルをする
②コミット する
③Herokuに新しいアプリケーションを作成する
④Heroku buildpackを追加する
⑤Herokuにデプロイをする
⑥データベースの移行をする
⑦アプリケーションにアクセスする
